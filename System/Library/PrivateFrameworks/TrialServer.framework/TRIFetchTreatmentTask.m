@implementation TRIFetchTreatmentTask

- (int)taskType
{
  return 3;
}

- (TRIFetchTreatmentTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v11;
  TRIFetchTreatmentTask *v12;
  TRIFetchTreatmentTask *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TRIFetchTreatmentTask;
  v12 = -[TRITreatmentBaseTask initWithExperiment:treatmentId:taskAttributing:](&v15, sel_initWithExperiment_treatmentId_taskAttributing_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilityModifier, a6);
    v13->retryCount = 0;
  }

  return v13;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v13, v12, v11, v10);

  return v14;
}

- (NSArray)dependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchExperimentTask taskWithExperimentDeployment:taskAttributing:](TRIFetchExperimentTask, "taskWithExperimentDeployment:taskAttributing:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](self, "containerForFirstNamespaceInExperimentWithContext:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addRefWithContentIdentifier:", v6);
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](self, "containerForFirstNamespaceInExperimentWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:container:](TRIContentTracker, "contentIdentifierForTreatmentArtifactWithTreatmentId:container:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v8, "dropRefWithContentIdentifier:", v7);
  if ((v4 & 1) == 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 errorResult:(id *)a7 fetchError:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  dispatch_semaphore_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  BOOL v29;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, int, void *, void *);
  void *v38;
  TRIFetchTreatmentTask *v39;
  NSObject *v40;
  uint64_t *v41;
  id *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (objc_msgSend(v14, "count"))
  {
    v31 = v16;
    v33 = v15;
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "ensureMobileAssetOriginFields");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setIsMobileAsset:", 1);

    -[TRIExperimentBaseTask mergeTelemetry:](self, "mergeTelemetry:", v18);
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__15;
    v49 = __Block_byref_object_dispose__15;
    -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v20, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v22 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke;
    v43[3] = &unk_1E93318B8;
    v23 = v21;
    v44 = v23;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v43);
    v24 = dispatch_semaphore_create(0);
    v25 = (void *)objc_opt_new();
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v22;
    v36 = 3221225472;
    v37 = __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke_2;
    v38 = &unk_1E93318E0;
    v39 = self;
    v41 = &v45;
    v42 = a8;
    v27 = v24;
    v40 = v27;
    v28 = (id)objc_msgSend(v25, "downloadAssets:attribution:aggregateProgress:group:completion:", v23, v26, 0, 0, &v35);

    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    if (a7)
      objc_storeStrong(a7, (id)v46[5]);
    v29 = objc_msgSend((id)v46[5], "runStatus", v31, v33, v35, v36, v37, v38, v39) == 2;

    _Block_object_dispose(&v45, 8);
    v16 = v32;
    v15 = v34;
  }
  else
  {
    v29 = 1;
  }

  return v29;
}

void __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "metadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullAssetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setObject:forKey:", v5, v4);
}

void __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v9;
  void **v10;
  void *v11;
  id v12;
  TRITaskRunResult *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a5;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "setWasDeferred:", 1);
  v10 = *(void ***)(a1 + 56);
  v11 = *v10;
  *v10 = v9;
  v12 = v9;

  v13 = [TRITaskRunResult alloc];
  v14 = -[TRITaskRunResult initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](v13, "initWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", a2, 1, MEMORY[0x1E0C9AA60], v17);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_saveTreatment:(id)a3 experimentRecord:(id)a4 assetURLs:(id)a5 assetMetadata:(id)a6 context:(id)a7 paths:(id)a8 downloadOptions:(id)a9
{
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v32;
  char v33;
  void *v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  NSObject *v41;
  TRIAssetStore *v42;
  void *v43;
  TRIAssetStore *v44;
  void *v45;
  TRIAssetStore *v46;
  void *v47;
  void *v48;
  int v49;
  TRIFBClientTreatmentStorage *v50;
  void *v51;
  NSObject *v52;
  id v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  char v58;
  uint64_t v59;
  uint64_t i;
  uint64_t (*v61)(uint64_t, uint64_t);
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  char *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  TRINamespaceDescriptorSetStorage *v91;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  TRIUserCovariates *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  void (**v110)(_QWORD, _QWORD);
  id obj;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  TRIClientTreatmentStorage *v116;
  uint64_t v117;
  void *v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[5];
  id v126;
  TRIAssetStore *v127;
  _BYTE *v128;
  _BYTE *v129;
  SEL v130;
  _QWORD v131[5];
  id v132;
  id v133;
  _BYTE *v134;
  _BYTE *v135;
  _QWORD v136[5];
  uint8_t v137[128];
  _BYTE v138[24];
  const char *v139;
  char v140;
  _BYTE buf[24];
  uint64_t (*v142)(uint64_t, uint64_t);
  _BYTE v143[20];
  uint64_t v144;

  v16 = a9;
  v144 = *MEMORY[0x1E0C80C00];
  v114 = a3;
  v119 = a4;
  v107 = a5;
  v108 = a6;
  v17 = a7;
  v120 = a8;
  v109 = a9;
  v113 = v17;
  objc_msgSend(v17, "experimentDatabase");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "namespaceDatabase");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = -[TRIUserCovariates initWithContext:]([TRIUserCovariates alloc], "initWithContext:", v17);
  v18 = MEMORY[0x1E0C809B0];
  v136[0] = MEMORY[0x1E0C809B0];
  v136[1] = 3221225472;
  v136[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke;
  v136[3] = &unk_1E9331908;
  v136[4] = self;
  v110 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v136);
  if (v114)
  {
    if (objc_msgSend(v114, "hasTreatmentId"))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "treatmentId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if ((v21 & 1) != 0)
      {
        if (objc_msgSend(v114, "factorLevelArray_Count"))
        {
          v22 = (void *)objc_opt_new();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v142 = __Block_byref_object_copy__15;
          *(_QWORD *)v143 = __Block_byref_object_dispose__15;
          *(_QWORD *)&v143[8] = 0;
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v16 = (void *)objc_msgSend(v114, "factorLevelArray_Count");
            -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIExperimentBaseTask experiment](self, "experiment");
            v84 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v138 = 134218498;
            *(_QWORD *)&v138[4] = v16;
            *(_WORD *)&v138[12] = 2112;
            *(_QWORD *)&v138[14] = v83;
            *(_WORD *)&v138[22] = 2114;
            v139 = v84;
            _os_log_debug_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEBUG, "got %lu factors defined in treatment %@ for experiment %{public}@", v138, 0x20u);

          }
          *(_QWORD *)v138 = 0;
          *(_QWORD *)&v138[8] = v138;
          *(_QWORD *)&v138[16] = 0x2020000000;
          LOBYTE(v139) = 1;
          objc_msgSend(v114, "factorLevelArray");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v131[0] = v18;
          v131[1] = 3221225472;
          v131[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_202;
          v131[3] = &unk_1E9331930;
          v131[4] = self;
          v134 = v138;
          v25 = v22;
          v132 = v25;
          v133 = v106;
          v135 = buf;
          objc_msgSend(v24, "enumerateObjectsUsingBlock:", v131);

          v26 = *(unsigned __int8 *)(*(_QWORD *)&v138[8] + 24);
          if (*(_BYTE *)(*(_QWORD *)&v138[8] + 24))
          {
            if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
            {
              objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_bundle_id"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRIExperimentBaseTask addDimension:](self, "addDimension:", v27);
              -[TRIUserCovariates tri_shortVersionStringForBundleId:](v105, "tri_shortVersionStringForBundleId:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC0FB0], "dimensionWithName:value:", CFSTR("client_app_version"), v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRIExperimentBaseTask addDimension:](self, "addDimension:", v29);

            }
            objc_msgSend(v25, "allObjects");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 26);
            v110[2](v110, 16);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = 0;
          }

          _Block_object_dispose(v138, 8);
          _Block_object_dispose(buf, 8);

          if (!v26)
            goto LABEL_92;
          if (v104)
          {
            if (objc_msgSend(v104, "count"))
            {
              if (objc_msgSend(v119, "type") == 1)
              {
                -[TRIExperimentBaseTask experiment](self, "experiment");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "startDate");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "endDate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v118, "namespacesAreAvailableForExperiment:startDate:endDate:namespaces:", v37, v38, v39, v104);

                if ((v40 & 1) == 0)
                {
                  TRILogCategory_Server();
                  v82 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
                  {
                    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRIExperimentBaseTask experiment](self, "experiment");
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v98, "shortDesc");
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v104, "componentsJoinedByString:", CFSTR(","));
                    v100 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "startDate");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "endDate");
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413314;
                    *(_QWORD *)&buf[4] = v97;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v99;
                    *(_WORD *)&buf[22] = 2114;
                    v142 = v100;
                    *(_WORD *)v143 = 2112;
                    *(_QWORD *)&v143[2] = v101;
                    *(_WORD *)&v143[10] = 2112;
                    *(_QWORD *)&v143[12] = v102;
                    _os_log_error_impl(&dword_1D207F000, v82, OS_LOG_TYPE_ERROR, "cannot install treatment %@ of experiment %{public}@ -- namespaces %{public}@ not available for experimentation during time from %@ to %@", buf, 0x34u);

                  }
                  -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 28);
                  v110[2](v110, 17);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_92;
                }
              }
              v33 = 0;
LABEL_35:
              *(_QWORD *)v138 = 0;
              *(_QWORD *)&v138[8] = v138;
              *(_QWORD *)&v138[16] = 0x2810000000;
              v139 = "";
              v140 = 1;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x3032000000;
              v142 = __Block_byref_object_copy__15;
              *(_QWORD *)v143 = __Block_byref_object_dispose__15;
              *(_QWORD *)&v143[8] = 0;
              v42 = [TRIAssetStore alloc];
              objc_msgSend(v109, "activity");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = -[TRIAssetStore initWithPaths:monitoredActivity:](v42, "initWithPaths:monitoredActivity:", v120, v43);

              objc_msgSend(v108, "cloudKit");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v125[0] = v18;
              v125[1] = 3221225472;
              v125[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_208;
              v125[3] = &unk_1E9331958;
              v130 = a2;
              v125[4] = self;
              v126 = v107;
              v128 = v138;
              v46 = v44;
              v127 = v46;
              v129 = buf;
              objc_msgSend(v45, "enumerateObjectsUsingBlock:", v125);

              if (*(_BYTE *)(*(_QWORD *)&v138[8] + 32))
              {
                if (*(_BYTE *)(*(_QWORD *)&v138[8] + 32) != 2)
                {
                  v49 = 1;
                  goto LABEL_43;
                }
                -[TRIFetchTreatmentTask setWasDeferred:](self, "setWasDeferred:", 1);
                -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 30);
                -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v47, 0);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:](TRICKNativeArtifactProvider, "fetchRetryDateFromErrorAndOptions:options:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v109);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (v47)
                {
                  -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 1);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v48, v47);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v110[2](v110, 20);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = 0;
                }
              }

              v49 = 0;
LABEL_43:

              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v138, 8);
              if (!v49)
              {
LABEL_92:

                goto LABEL_13;
              }
              v116 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v120);
              -[TRIClientTreatmentStorage saveTreatment:](v116, "saveTreatment:", v114);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              if (_os_feature_enabled_impl())
              {
                v50 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v120);
                -[TRIFBClientTreatmentStorage saveTreatment:](v50, "saveTreatment:", v114);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v51, "isEqual:", v103) & 1) == 0)
                {
                  TRILogCategory_Server();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    *(_QWORD *)&buf[4] = v51;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v103;
                    _os_log_error_impl(&dword_1D207F000, v52, OS_LOG_TYPE_ERROR, "Saving to fb based storage:%{public}@ did not match pb based storage:%{public}@", buf, 0x16u);
                  }

                }
                if (_os_feature_enabled_impl())
                {
                  v53 = v51;

                  v103 = v53;
                }

              }
              if (v103)
              {
                objc_msgSend(v119, "treatmentId");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v54 == 0;

                if (!v55
                  || (-[TRITreatmentBaseTask treatmentId](self, "treatmentId"),
                      v56 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[TRIExperimentBaseTask experiment](self, "experiment"),
                      v57 = (void *)objc_claimAutoreleasedReturnValue(),
                      v58 = objc_msgSend(v118, "setTreatmentId:forExperimentDeployment:usingTransaction:", v56, v57, 0), v57, v56, (v58 & 1) != 0))
                {
                  v112 = (void *)objc_opt_new();
                  if ((v33 & 1) != 0 || !objc_msgSend(v104, "count"))
                  {
                    v59 = 2;
                  }
                  else
                  {
                    v123 = 0u;
                    v124 = 0u;
                    v121 = 0u;
                    v122 = 0u;
                    obj = v104;
                    v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
                    if (v117)
                    {
                      v115 = *(_QWORD *)v122;
                      v59 = 2;
                      do
                      {
                        for (i = 0; i != v117; ++i)
                        {
                          if (*(_QWORD *)v122 != v115)
                            objc_enumerationMutation(obj);
                          v61 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v121 + 1) + 8 * i);
                          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          -[TRIClientTreatmentStorage urlForFactorsWithTreatmentId:namespaceName:](v116, "urlForFactorsWithTreatmentId:namespaceName:", v62, v61);
                          v63 = (void *)objc_claimAutoreleasedReturnValue();

                          -[TRIExperimentBaseTask experiment](self, "experiment");
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          v65 = objc_msgSend(v118, "setTreatmentURL:forExperimentDeployment:namespaceName:", v63, v64, v61);

                          if ((v65 & 1) == 0)
                          {
                            -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 21);
                            v59 = 3;
                          }
                          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0BA0]), "initWithPaths:", v120);
                          -[TRIExperimentBaseTask experiment](self, "experiment");
                          v67 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v67, "experimentId");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v66, "setExperimentId:", v68);

                          -[TRIExperimentBaseTask experiment](self, "experiment");
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v66, "setDeploymentId:", objc_msgSend(v69, "deploymentId"));

                          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v66, "setTreatmentId:", v70);

                          objc_msgSend(v66, "setNamespaceName:", v61);
                          objc_msgSend(v63, "triPathAsOwner:", 0);
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v71, "stringByDeletingLastPathComponent");
                          v72 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v72 || (objc_msgSend(v66, "saveToDir:", v72) & 1) == 0)
                          {
                            TRILogCategory_Server();
                            v73 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                            {
                              -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                              v76 = (void *)objc_claimAutoreleasedReturnValue();
                              -[TRIExperimentBaseTask experiment](self, "experiment");
                              v77 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412802;
                              *(_QWORD *)&buf[4] = v76;
                              *(_WORD *)&buf[12] = 2114;
                              *(_QWORD *)&buf[14] = v77;
                              *(_WORD *)&buf[22] = 2114;
                              v142 = v61;
                              _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "failed to save info for treatment %@ of experiment %{public}@ with namespace %{public}@", buf, 0x20u);

                            }
                            -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 18);
                            v59 = 3;
                          }
                          -[TRIFetchTreatmentTask _namespaceDescriptorForNamespaceName:fromExperimentRecord:referencingFactorsURL:](self, "_namespaceDescriptorForNamespaceName:fromExperimentRecord:referencingFactorsURL:", v61, v119, v63);
                          v74 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v74)
                          {
                            objc_msgSend(v112, "addObject:", v74);
                          }
                          else
                          {
                            TRILogCategory_Server();
                            v75 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                            {
                              -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                              v78 = (void *)objc_claimAutoreleasedReturnValue();
                              -[TRIExperimentBaseTask experiment](self, "experiment");
                              v79 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412802;
                              *(_QWORD *)&buf[4] = v78;
                              *(_WORD *)&buf[12] = 2114;
                              *(_QWORD *)&buf[14] = v79;
                              *(_WORD *)&buf[22] = 2114;
                              v142 = v61;
                              _os_log_error_impl(&dword_1D207F000, v75, OS_LOG_TYPE_ERROR, "failed to compute namespace descriptor set entry for treatment %@ of experiment %{public}@ with namespace %{public}@", buf, 0x20u);

                            }
                            -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 7);
                            v59 = 3;
                          }

                        }
                        v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
                      }
                      while (v117);
                    }
                    else
                    {
                      v59 = 2;
                    }

                  }
                  v91 = -[TRINamespaceDescriptorSetStorage initWithPaths:]([TRINamespaceDescriptorSetStorage alloc], "initWithPaths:", v120);
                  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = -[TRINamespaceDescriptorSetStorage overwriteNamespaceDescriptors:forTreatmentId:](v91, "overwriteNamespaceDescriptors:forTreatmentId:", v112, v92);

                  if (!v93)
                  {
                    -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 17);
                    v59 = 3;
                  }

                  -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", v59);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v59, 1, v94, 0);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_91;
                }
                TRILogCategory_Server();
                v81 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                {
                  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIExperimentBaseTask experiment](self, "experiment");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v95;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v96;
                  _os_log_debug_impl(&dword_1D207F000, v81, OS_LOG_TYPE_DEBUG, "failed to save treatment id %@ to database for experiment %{public}@", buf, 0x16u);

                }
                -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 19);
                v110[2](v110, 18);
                v80 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 20);
                v110[2](v110, 18);
                v80 = objc_claimAutoreleasedReturnValue();
              }
              v16 = (void *)v80;
LABEL_91:

              goto LABEL_92;
            }
            v33 = 0;
          }
          else
          {
            v104 = 0;
            v33 = 1;
          }
        }
        else
        {
          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRIExperimentBaseTask experiment](self, "experiment");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "shortDesc");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v88;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v90;
            _os_log_debug_impl(&dword_1D207F000, v32, OS_LOG_TYPE_DEBUG, "no factors defined in treatment %@ for experiment %{public}@", buf, 0x16u);

          }
          v104 = 0;
          v33 = 1;
        }
        TRILogCategory_Server();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](self, "experiment");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "shortDesc");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v85;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v87;
          _os_log_debug_impl(&dword_1D207F000, v41, OS_LOG_TYPE_DEBUG, "no namespaces used in treatment %@ for experiment %{public}@", buf, 0x16u);

        }
        goto LABEL_35;
      }
    }
  }
  TRILogCategory_Server();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v114, "hasTreatmentId");
    if (v35)
    {
      objc_msgSend(v114, "treatmentId");
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = CFSTR("(unset)");
    }
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Mismatched treatmentId: (exp: %@, act: %@)", buf, 0x16u);
    if (v35)

  }
  -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 27);
  v110[2](v110, 15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v16;
}

id __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 134217984;
    v9 = a2;
    _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Saving treatment failed with reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_nextTasksForRunStatusFailureWithDeactivationReason:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_202(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "factor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "namespaceString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    objc_msgSend(*(id *)(a1 + 48), "dynamicNamespaceRecordWithNamespaceName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "taskAttributing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applicationBundleIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "experiment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "factor message does not contain namespace field in treatment %@ of experiment %{public}@", (uint8_t *)&v16, 0x16u);

    }
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_208(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "treatmentIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchTreatmentTask.m"), 256, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("ra.metadata.treatmentIndex"));

  }
  v9 = objc_msgSend(v8, "index");

  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(a1 + 48);
    objc_msgSend(v6, "assetId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v16 + 40);
    LOBYTE(v13) = objc_msgSend(v13, "saveAssetWithIdentifier:assetURL:metadata:error:", v14, v12, v15, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = (_BYTE)v13;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) == 1)
      goto LABEL_10;
  }
  else
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "assetId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "treatmentId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v18;
      v24 = 1024;
      v25 = v9;
      v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unexpected missing assetURL for assetId %{public}@ at ck index %d in treatment %@.", buf, 0x1Cu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = 0;
  }
  *a4 = 1;
LABEL_10:

}

- (unsigned)_ncvForNamespaceName:(id)a3 inExperimentRecord:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a4, "namespaces", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = objc_msgSend(v11, "compatibilityVersion");
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = -1;
LABEL_11:

  return v14;
}

- (id)_namespaceDescriptorForNamespaceName:(id)a3 fromExperimentRecord:(id)a4 referencingFactorsURL:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a5;
  v10 = -[TRIFetchTreatmentTask _ncvForNamespaceName:inExperimentRecord:](self, "_ncvForNamespaceName:inExperimentRecord:", v8, a4);
  if ((_DWORD)v10 == -1)
  {
    v13 = 0;
  }
  else
  {
    v11 = v10;
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setFactorsURL:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AD8]), "initWithNamespaceName:downloadNCV:optionalParams:", v8, v11, v12);

  }
  return v13;
}

- (id)_fetchTreatmentWithArtifactProvider:(id)a3 experimentRecord:(id)a4 downloadOptions:(id)a5 context:(id)a6 treatment:(id *)a7 recordId:(id *)a8 treatmentFetchError:(id *)a9
{
  id v16;
  id v17;
  dispatch_semaphore_t v18;
  TRIFetchOptions *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  TRIFetchTreatmentTask *v40;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  id *v44;
  id *v45;
  id *v46;
  SEL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v16 = a4;
  v36 = a5;
  v17 = a6;
  v18 = dispatch_semaphore_create(0);
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__15;
  v52 = __Block_byref_object_dispose__15;
  v53 = 0;
  v19 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v36, &unk_1E9363AE0);
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke;
  v37[3] = &unk_1E9331980;
  v21 = v16;
  v38 = v21;
  v22 = v17;
  v39 = v22;
  v40 = self;
  v42 = &v54;
  v43 = &v48;
  v44 = a9;
  v45 = a7;
  v46 = a8;
  v47 = a2;
  v23 = v18;
  v41 = v23;
  v24 = (id)objc_msgSend(v35, "fetchTreatmentWithId:options:completion:", v20, v19, v37);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v23);
  v25 = *((unsigned int *)v55 + 6);
  if ((_DWORD)v25 != 2)
  {
    if ((_DWORD)v25 == 3)
    {
      -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v26, v49[5]);
    }
    else
    {
      -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v25, 1, v26, v49[5]);
    }
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v28 = (void *)v27;

    goto LABEL_14;
  }
  if (!*a7)
  {
    TRILogCategory_Server();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shortDesc");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v59 = v31;
      v60 = 2114;
      v61 = v33;
      _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "CloudKit fetch succeeded, but a valid treatment was not obtained for treatment %@ of experiment %{public}@.", buf, 0x16u);

    }
    -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 9);
    -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v26, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (!*a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 503, CFSTR("Decoded a treatment but failed to associate a CKRecordID"));

  }
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E0C9AA60], 0, v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v28;
}

void __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke_2;
  v33[3] = &unk_1E9330940;
  v34 = *(id *)(a1 + 32);
  v35 = *(id *)(a1 + 40);
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v33);
  switch(a2)
  {
    case 0:
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDesc");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v26;
        v38 = 2114;
        v39 = v28;
        v40 = 2114;
        v41 = v15;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Error fetching treatment %@ of experiment %{public}@: %{public}@", buf, 0x20u);

      }
      v16[2](v16, 1);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 3;
      goto LABEL_11;
    case 1:
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDesc");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v19;
        v38 = 2114;
        v39 = v21;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Cancelled fetch of treatment %@ for experiment %{public}@", buf, 0x16u);

      }
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = 4;
      goto LABEL_14;
    case 2:
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "shortDesc");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v29;
        v38 = 2114;
        v39 = v30;
        v40 = 2114;
        v41 = v15;
        _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "Fetching treatment %@ of experiment %{public}@: resulted in retry-able error %{public}@", buf, 0x20u);

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a6);
LABEL_11:
      objc_storeStrong(*(id **)(a1 + 80), a7);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), CFSTR("TRIFetchTreatmentTask.m"), 470, CFSTR("Unexpected status TRIFetchStatusMoreResultsPending"));

      break;
    case 4:
      objc_storeStrong(*(id **)(a1 + 88), a4);
      objc_storeStrong(*(id **)(a1 + 96), a3);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = 2;
LABEL_14:
      *(_DWORD *)(v22 + 24) = v23;
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "namespaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        TRILogCategory_Server();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v10;
          _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "notify namespace download failed: %{public}@", buf, 0xCu);

        }
        v11 = (void *)MEMORY[0x1E0DC0B18];
        objc_msgSend(v8, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateStatusFetchSuccess:forNamespaceName:withContext:", 0, v12, *(_QWORD *)(a1 + 40));

        v13 = (void *)MEMORY[0x1E0DC0A00];
        objc_msgSend(v8, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "notifyDownloadFailedForKey:withError:", v14, a2);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

}

- (id)_fetchAssetsWithArtifactProvider:(id)a3 recordId:(id)a4 experimentRecord:(id)a5 assetIndexes:(id)a6 downloadOptions:(id)a7 context:(id)a8 assetURLs:(id *)a9 treatmentFetchError:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  TRIFetchOptions *v20;
  dispatch_semaphore_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  TRIFetchOptions *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  TRIFetchTreatmentTask *v41;
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  id *v45;
  id *v46;
  SEL v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;

  v35 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v34 = a7;
  v19 = a8;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", 0, 0);
  v20 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v33, &unk_1E9363AE0);
  v21 = dispatch_semaphore_create(0);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__15;
  v54 = __Block_byref_object_dispose__15;
  v55 = 0;
  v22 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke;
  v48[3] = &unk_1E93319A8;
  v49 = v17;
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_241;
  v38[3] = &unk_1E93319D0;
  v32 = v49;
  v39 = v32;
  v31 = v19;
  v40 = v31;
  v41 = self;
  v43 = &v56;
  v44 = &v50;
  v45 = a10;
  v46 = a9;
  v47 = a2;
  v23 = v21;
  v42 = v23;
  v37 = v18;
  v24 = v18;
  v25 = v20;
  v26 = (id)objc_msgSend(v35, "fetchAssetsWithIndexes:fromTreatmentWithRecordId:options:progress:completion:", v24, v16, v20, v48, v38);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v23);
  v27 = *((unsigned int *)v57 + 6);
  if ((_DWORD)v27 == 3)
  {
    -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v28, v51[5]);
  }
  else
  {
    -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", *((unsigned int *)v57 + 6));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v27, 1, v28, v51[5]);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v29;
}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  unint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "namespaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        TRILogCategory_Server();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v18 = v12;
          v19 = 2048;
          v20 = (unint64_t)(a2 * 100.0);
          _os_log_debug_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEBUG, "notify namespace download progress: %{public}@, %tu%%", buf, 0x16u);

        }
        v10 = (void *)MEMORY[0x1E0DC0A00];
        objc_msgSend(v8, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "notifyDownloadProgressForKey:withProgress:", v11, (unint64_t)(a2 * 100.0));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v5);
  }

}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_241(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_2;
  v28[3] = &unk_1E9330940;
  v29 = *(id *)(a1 + 32);
  v30 = *(id *)(a1 + 40);
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v28);
  switch(a2)
  {
    case 0:
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "shortDesc");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v22;
        v33 = 2114;
        v34 = v24;
        v35 = 2114;
        v36 = v12;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Error fetching assets for treatment %@ of experiment %{public}@: %{public}@", buf, 0x20u);

      }
      v13[2](v13, 1);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 3;
      goto LABEL_11;
    case 1:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "shortDesc");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v16;
        v33 = 2114;
        v34 = v18;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "Cancelled fetch of assets for treatment %@ of experiment %{public}@", buf, 0x16u);

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 4;
      break;
    case 2:
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "treatmentId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "experiment");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "shortDesc");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v25;
        v33 = 2114;
        v34 = v26;
        v35 = 2114;
        v36 = v12;
        _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Fetching assets for treatment %@ of experiment %{public}@: resulted in retry-able error %{public}@", buf, 0x20u);

      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a4);
LABEL_11:
      objc_storeStrong(*(id **)(a1 + 80), a5);
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 48), CFSTR("TRIFetchTreatmentTask.m"), 570, CFSTR("Unexpected status TRIFetchStatusMoreResultsPending"));

      break;
    case 4:
      objc_storeStrong(*(id **)(a1 + 88), a3);
      if (v10)
        v21 = 2;
      else
        v21 = 3;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v21;
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "namespaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        TRILogCategory_Server();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v21 = v10;
          _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "notify namespace download failed: %{public}@", buf, 0xCu);

        }
        v11 = (void *)MEMORY[0x1E0DC0B18];
        objc_msgSend(v8, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateStatusFetchSuccess:forNamespaceName:withContext:", 0, v12, *(_QWORD *)(a1 + 40));

        v13 = (void *)MEMORY[0x1E0DC0A00];
        objc_msgSend(v8, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "notifyDownloadFailedForKey:withError:", v14, a2);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

}

- (id)_nextTasksForRunStatusFailureWithDeactivationReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deploymentId");
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v6, v8, 0, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_addMetricForFetchTreatmentTaskError:(int)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0DC0F08];
  fetchTaskErrorAsString(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metricWithName:categoricalValue:", CFSTR("fetchtreatmenttask_error"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[TRIExperimentBaseTask addMetric:](self, "addMetric:", v6);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
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
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  TRIAssetStore *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t m;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
  NSObject *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  const __CFString *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  id v165;
  _QWORD v166[5];
  id v167;
  SEL v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  _QWORD v177[4];
  id v178;
  TRIFetchTreatmentTask *v179;
  uint64_t *v180;
  uint64_t *v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  char v186;
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t);
  void (*v191)(uint64_t);
  id v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  uint64_t (*v196)(uint64_t, uint64_t);
  void (*v197)(uint64_t);
  id v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  uint8_t v202[128];
  uint8_t buf[4];
  uint64_t v204;
  __int16 v205;
  uint64_t v206;
  __int16 v207;
  uint64_t v208;
  __int16 v209;
  uint64_t v210;
  __int16 v211;
  const __CFString *v212;
  uint64_t v213;

  v213 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v145 = a4;
  v152 = v7;
  objc_msgSend(v7, "keyValueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v8);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "experimentDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "experimentRecordWithExperimentDeployment:", v10);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  if (v151)
  {
    if (objc_msgSend(v151, "type") == 3)
      -[TRIExperimentBaseTask logAsRollout:](self, "logAsRollout:", 1);
    -[TRIExperimentBaseTask containerForFirstNamespaceInExperimentWithContext:](self, "containerForFirstNamespaceInExperimentWithContext:", v7);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v150)
    {
      objc_msgSend(v11, "pathsForContainer:asClientProcess:", v150, 0);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = (uint64_t)v11;
    }
    v143 = (void *)v13;
    if (!v13)
    {
      TRILogCategory_Server();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v150, "identifier");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v204 = (uint64_t)v127;
        _os_log_error_impl(&dword_1D207F000, v81, OS_LOG_TYPE_ERROR, "Unable to fetch treatment into missing app container: %{public}@", buf, 0xCu);

      }
      -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 2);
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "experimentId");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v83, v84, objc_msgSend(v85, "deploymentId"), v151, 0, v7);

      -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 21);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v144, 0);
      v146 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_106;
    }
    objc_msgSend(v7, "namespaceDatabase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "namespaceDescriptorsDefaultDir");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v19, v21);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    v193 = 0;
    v194 = &v193;
    v195 = 0x3032000000;
    v196 = __Block_byref_object_copy__15;
    v197 = __Block_byref_object_dispose__15;
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "applicationBundleIdentifier");
    v198 = (id)objc_claimAutoreleasedReturnValue();

    v187 = 0;
    v188 = &v187;
    v189 = 0x3032000000;
    v190 = __Block_byref_object_copy__15;
    v191 = __Block_byref_object_dispose__15;
    v192 = 0;
    v183 = 0;
    v184 = &v183;
    v185 = 0x2020000000;
    v186 = 0;
    v23 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v151, "artifact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "namespaces");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v177[0] = MEMORY[0x1E0C809B0];
    v177[1] = 3221225472;
    v177[2] = __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke;
    v177[3] = &unk_1E93319F8;
    v26 = v143;
    v180 = &v187;
    v181 = &v193;
    v178 = v26;
    v179 = self;
    v182 = &v183;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v177);

    objc_autoreleasePoolPop(v23);
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "triCloudKitContainer");
    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "teamIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", v28, v30, v194[5], v148, v144, v152);
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "networkOptions");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v149, "allowsCellularAccess"))
    {
      objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("allows_cellular_download"), objc_msgSend(v149, "allowsCellularAccess"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask addMetric:](self, "addMetric:", v32);

    }
    if (objc_msgSend(v149, "discretionaryBehavior"))
    {
      -[TRIBaseTask stateProvider](self, "stateProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "activeActivityDescriptorGrantingCapability:", 16);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(v149, "setActivity:", v35);
        objc_msgSend(v33, "activeActivityDescriptorGrantingCapability:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_msgSend(v149, "allowsCellularAccess");
        if (v36)
          v38 = 0;
        else
          v38 = v37;
        if (v38 != 1 || (v39 = (void *)v194[5]) != 0 && objc_msgSend(v39, "length") && *((_BYTE *)v184 + 24))
        {

          goto LABEL_23;
        }
        TRILogCategory_Server();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "experimentDeployment");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "experimentId");
          v147 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "namespaces");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "firstObject");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "name");
          v132 = objc_claimAutoreleasedReturnValue();
          v133 = (void *)v132;
          v134 = v194[5];
          if (*((_BYTE *)v184 + 24))
            v135 = CFSTR("YES");
          else
            v135 = CFSTR("NO");
          *(_DWORD *)buf = 138413314;
          v204 = (uint64_t)v128;
          v205 = 2114;
          v206 = (uint64_t)v147;
          v207 = 2114;
          v208 = v132;
          v209 = 2114;
          v210 = v134;
          v211 = 2114;
          v212 = v135;
          _os_log_error_impl(&dword_1D207F000, v98, OS_LOG_TYPE_ERROR, "preventing fetch of treatment %@ on cellular for experiment %{public}@ namespace %{public}@, resourceAttributionBundleIdentifier: %{public}@ expensiveNetworkingAllowed: %{public}@", buf, 0x34u);

        }
        -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 23);
        -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 0, v97, 0);
        v146 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        TRILogCategory_Server();
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v96, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 3);
        -[TRIFetchTreatmentTask _nextTasksForRunStatus:](self, "_nextTasksForRunStatus:", 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 1, 1, v97, 0);
        v146 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_105:
      _Block_object_dispose(&v183, 8);
      _Block_object_dispose(&v187, 8);

      _Block_object_dispose(&v193, 8);
LABEL_106:

      goto LABEL_107;
    }
LABEL_23:
    v175 = 0;
    v176 = 0;
    v174 = 0;
    -[TRIFetchTreatmentTask _fetchTreatmentWithArtifactProvider:experimentRecord:downloadOptions:context:treatment:recordId:treatmentFetchError:](self, "_fetchTreatmentWithArtifactProvider:experimentRecord:downloadOptions:context:treatment:recordId:treatmentFetchError:", v142, v151, v149, v152, &v175, &v176, &v174);
    v173 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v173, "runStatus") != 2)
    {
      if (v174)
      {
        self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
        TRIFetchErrorParseToMetrics(v174);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v86, "count"))
        {
          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          v87 = v86;
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v169, v202, 16);
          if (v88)
          {
            v89 = *(_QWORD *)v170;
            do
            {
              for (i = 0; i != v88; ++i)
              {
                if (*(_QWORD *)v170 != v89)
                  objc_enumerationMutation(v87);
                -[TRIExperimentBaseTask addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * i));
              }
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v169, v202, 16);
            }
            while (v88);
          }

        }
      }
      if (objc_msgSend(v173, "runStatus") == 3)
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "experimentId");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v92, v93, objc_msgSend(v94, "deploymentId"), v151, 0, v152);

      }
      v95 = v173;
      v146 = v95;
      goto LABEL_104;
    }
    if (!v175)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatment"));

    }
    if (!v176)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentRecordId"));

    }
    v140 = (void *)objc_opt_new();
    v40 = -[TRIAssetStore initWithPaths:]([TRIAssetStore alloc], "initWithPaths:", v26);
    v41 = v175;
    v42 = v188[5];
    objc_msgSend(v152, "keyValueStore");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIClientFactorPackUtils aliasesInNamespace:](TRIClientFactorPackUtils, "aliasesInNamespace:", v188[5]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "requiredAssetsForInstallationForNamespace:assetStore:maProvider:subscriptionSettings:aliasToUnaliasMap:", v42, v40, v140, v44, v45);
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v141)
    {
      -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 5);
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "experimentId");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v100, v101, objc_msgSend(v102, "deploymentId"), v151, 0, v152);

      -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 22);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 1, v103, 0);
      v146 = (id)objc_claimAutoreleasedReturnValue();
LABEL_103:

      v95 = v173;
LABEL_104:

      goto LABEL_105;
    }
    TRILogCategory_Server();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v141, "cloudKit");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");
      objc_msgSend(v141, "mobileAsset");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v204 = v48;
      v205 = 2048;
      v206 = v50;
      v207 = 2114;
      v208 = (uint64_t)v51;
      _os_log_impl(&dword_1D207F000, v46, OS_LOG_TYPE_DEFAULT, "Found %lu required CK assets and %lu required MA assets for treatment %{public}@", buf, 0x20u);

    }
    v52 = (void *)objc_opt_new();
    objc_msgSend(v141, "cloudKit");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v166[0] = MEMORY[0x1E0C809B0];
    v166[1] = 3221225472;
    v166[2] = __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_262;
    v166[3] = &unk_1E9331A20;
    v166[4] = self;
    v139 = v52;
    v167 = v139;
    v168 = a2;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v166);

    TRILogCategory_Server();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIExperimentBaseTask experiment](self, "experiment");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "shortDesc");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v139, "count");
      *(_DWORD *)buf = 138412802;
      v204 = (uint64_t)v55;
      v205 = 2114;
      v206 = (uint64_t)v57;
      v207 = 2048;
      v208 = v58;
      _os_log_impl(&dword_1D207F000, v54, OS_LOG_TYPE_DEFAULT, "Treatment %@ of experiment %{public}@ references %tu assets which are required for enrollment and are not already on disk.", buf, 0x20u);

    }
    v165 = 0;
    v59 = v174;
    v174 = 0;

    -[TRIFetchTreatmentTask _fetchAssetsWithArtifactProvider:recordId:experimentRecord:assetIndexes:downloadOptions:context:assetURLs:treatmentFetchError:](self, "_fetchAssetsWithArtifactProvider:recordId:experimentRecord:assetIndexes:downloadOptions:context:assetURLs:treatmentFetchError:", v142, v176, v151, v139, v149, v152, &v165, &v174);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v173;
    v173 = v60;

    if (objc_msgSend(v173, "runStatus") == 2)
    {
      if (!v165)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 808, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetURLs"));

      }
      v62 = v174;
      v174 = 0;

      objc_msgSend(v141, "mobileAsset");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "namespaces");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "name");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[TRIFetchTreatmentTask _downloadAndSaveMAAssets:options:downloadNotificationKey:context:errorResult:fetchError:](self, "_downloadAndSaveMAAssets:options:downloadNotificationKey:context:errorResult:fetchError:", v63, v149, v66, v152, &v173, &v174);

      if (v67 && objc_msgSend(v173, "runStatus") == 2)
      {
        -[TRIFetchTreatmentTask _saveTreatment:experimentRecord:assetURLs:assetMetadata:context:paths:downloadOptions:](self, "_saveTreatment:experimentRecord:assetURLs:assetMetadata:context:paths:downloadOptions:", v175, v151, v165, v141, v152, v26, v149);
        v146 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v146, "runStatus") == 2)
        {
          objc_msgSend(v165, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
          v155 = 0u;
          v156 = 0u;
          v153 = 0u;
          v154 = 0u;
          objc_msgSend(v151, "namespaces");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v153, v199, 16);
          if (v69)
          {
            v70 = *(_QWORD *)v154;
            do
            {
              for (j = 0; j != v69; ++j)
              {
                if (*(_QWORD *)v154 != v70)
                  objc_enumerationMutation(v68);
                v72 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * j);
                TRILogCategory_Server();
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v72, "name");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v204 = (uint64_t)v74;
                  _os_log_impl(&dword_1D207F000, v73, OS_LOG_TYPE_DEFAULT, "notify namespace download completed: %{public}@", buf, 0xCu);

                }
                v75 = (void *)MEMORY[0x1E0DC0A00];
                objc_msgSend(v72, "name");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "notifyDownloadCompletedForKey:", v76);

              }
              v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v153, v199, 16);
            }
            while (v69);
          }

          -[TRIExperimentBaseTask experiment](self, "experiment");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "experimentId");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](self, "experiment");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v78, v79, objc_msgSend(v80, "deploymentId"), v151, 0, v152);
          goto LABEL_110;
        }
        if (objc_msgSend(v146, "runStatus") == 3)
        {
          -[TRIExperimentBaseTask experiment](self, "experiment");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "experimentId");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIExperimentBaseTask experiment](self, "experiment");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v78, v79, objc_msgSend(v80, "deploymentId"), v151, 0, v152);
LABEL_110:

        }
LABEL_102:

        v103 = v139;
        goto LABEL_103;
      }
      if (v174)
      {
        TRIFetchErrorParseToMetrics(v174);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v113, "count"))
        {
          v159 = 0u;
          v160 = 0u;
          v157 = 0u;
          v158 = 0u;
          v114 = v113;
          v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v157, v200, 16);
          if (v115)
          {
            v116 = *(_QWORD *)v158;
            do
            {
              for (k = 0; k != v115; ++k)
              {
                if (*(_QWORD *)v158 != v116)
                  objc_enumerationMutation(v114);
                -[TRIExperimentBaseTask addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k));
              }
              v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v157, v200, 16);
            }
            while (v115);
          }

        }
      }
      TRILogCategory_Server();
      v118 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v204 = (uint64_t)v174;
        _os_log_error_impl(&dword_1D207F000, v118, OS_LOG_TYPE_ERROR, "Failed to download MA treatment assets: %@", buf, 0xCu);
      }

      if (objc_msgSend(v173, "runStatus") == 3)
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "experimentId");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v120, v121, objc_msgSend(v122, "deploymentId"), v151, 0, v152);

      }
    }
    else
    {
      if (v174)
      {
        TRIFetchErrorParseToMetrics(v174);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v104, "count"))
        {
          v163 = 0u;
          v164 = 0u;
          v161 = 0u;
          v162 = 0u;
          v105 = v104;
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v161, v201, 16);
          if (v106)
          {
            v107 = *(_QWORD *)v162;
            do
            {
              for (m = 0; m != v106; ++m)
              {
                if (*(_QWORD *)v162 != v107)
                  objc_enumerationMutation(v105);
                -[TRIExperimentBaseTask addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * m));
              }
              v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v161, v201, 16);
            }
            while (v106);
          }

        }
      }
      if (objc_msgSend(v173, "runStatus") == 3)
      {
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "experimentId");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIExperimentBaseTask experiment](self, "experiment");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v110, v111, objc_msgSend(v112, "deploymentId"), v151, 0, v152);

      }
    }
    v146 = v173;
    goto LABEL_102;
  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[TRIExperimentBaseTask experiment](self, "experiment");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "shortDesc");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v204 = (uint64_t)v125;
    v205 = 2112;
    v206 = (uint64_t)v126;
    _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unable to look up experiment %{public}@ associated with treatment %@.", buf, 0x16u);

  }
  -[TRIFetchTreatmentTask _addMetricForFetchTreatmentTaskError:](self, "_addMetricForFetchTreatmentTaskError:", 2);
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "experimentId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v16, v17, objc_msgSend(v18, "deploymentId"), 0, 0, v7);

  -[TRIFetchTreatmentTask _nextTasksForRunStatusFailureWithDeactivationReason:](self, "_nextTasksForRunStatusFailureWithDeactivationReason:", 3);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 3, 0, v150, 0);
  v146 = (id)objc_claimAutoreleasedReturnValue();
LABEL_107:

  return v146;
}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(*(id *)(a1 + 32), "namespaceDescriptorsDefaultDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadWithNamespaceName:fromDirectory:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_msgSend(v10, "resourceAttributionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "resourceAttributionIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "treatmentId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v18 = 138412546;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_INFO, "attributing treatment fetch for %@ to %{public}@", (uint8_t *)&v18, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v10, "expensiveNetworkingAllowed");
    *a4 = 1;
  }

}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_262(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "treatmentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Treatment %@ requires asset %{public}@ which is not already on disk; will be downloaded.",
      buf,
      0x16u);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "treatmentIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIFetchTreatmentTask.m"), 774, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("ra.metadata.treatmentIndex"));

  }
  objc_msgSend(v7, "addIndex:", objc_msgSend(v9, "index"));

}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_265(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0;
  v4 = *MEMORY[0x1E0C99998];
  v9 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v10, v4, &v9);
  v6 = v10;
  v7 = v9;
  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 2114;
      v14 = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "failed fetching file size for url %@ error %{public}@", buf, 0x16u);
    }

  }
}

- (id)_asPersistedTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v5);

  -[TRIExperimentBaseTask experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTreatmentId:", v7);

  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asPersistedTaskAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskAttribution:", v9);

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchTreatmentTask retryCount](self, "retryCount"));
  -[TRITaskCapabilityModifier asPersistedModifier](self->_capabilityModifier, "asPersistedModifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCapabilityModifier:", v10);

  return v3;
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIFetchTreatmentTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 879, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  TRITaskCapabilityModifier *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  TRITaskCapabilityModifier *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  const char *v25;
  objc_class *v26;
  NSObject *v27;
  objc_class *v28;
  objc_class *v29;
  objc_class *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  +[TRIPBMessage parseFromData:error:](TRIFetchTreatmentPersistedTask, "parseFromData:error:", a3, &v41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v41;
  if (!v3)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      v34 = 0;
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138543362;
    v43 = v4;
    v19 = "Unable to parse buffer as TRIFetchTreatmentPersistedTask: %{public}@";
    v20 = v10;
    v21 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "hasExperimentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v32;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_31;
  }
  objc_msgSend(v3, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_31:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    goto LABEL_32;
  }
  if ((objc_msgSend(v3, "hasTreatmentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v37;
      _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);

    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: treatmentId";
    goto LABEL_31;
  }
  objc_msgSend(v3, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with field of length 0: treatmentId";
    goto LABEL_31;
  }
  if ((objc_msgSend(v3, "hasDeploymentId") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_31;
  }
  if ((objc_msgSend(v3, "hasTaskAttribution") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v24;
    v25 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_31;
  }
  if (objc_msgSend(v3, "deploymentId") == -1)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v19 = "TRIFetchTreatmentPersistedTask encodes unspecified deploymentId.";
    v20 = v10;
    v21 = 2;
    goto LABEL_14;
  }
  objc_msgSend(v3, "taskAttribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:](TRITaskAttributionInternalInsecure, "taskAttributionFromPersistedTask:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC0A30]);
    objc_msgSend(v3, "experimentId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithExperimentId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

    if ((objc_msgSend(v3, "hasCapabilityModifier") & 1) != 0)
    {
      v14 = [TRITaskCapabilityModifier alloc];
      objc_msgSend(v3, "capabilityModifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "add");
      objc_msgSend(v3, "capabilityModifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, objc_msgSend(v17, "remove"));

    }
    else
    {
      v18 = (TRITaskCapabilityModifier *)objc_opt_new();
    }
    v38 = (void *)objc_opt_class();
    objc_msgSend(v3, "treatmentId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "taskWithExperiment:treatmentId:taskAttributing:capabilityModifier:", v13, v39, v10, v18);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "hasRetryCount"))
      v40 = objc_msgSend(v3, "retryCount");
    else
      v40 = 0;
    objc_msgSend(v34, "setRetryCount:", v40);

  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v34 = 0;
  }

LABEL_33:
  return v34;
}

- (unint64_t)requiredCapabilities
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v9;

  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiredCapability");
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchTreatmentTask;
  v6 = -[TRIBaseTask requiredCapabilities](&v9, sel_requiredCapabilities) | v5;
  v7 = v6 | (4 * (-[TRIFetchTreatmentTask retryCount](self, "retryCount") > 0));

  return -[TRITaskCapabilityModifier updateCapability:](self->_capabilityModifier, "updateCapability:", v7);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TRIExperimentBaseTask experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDesc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITreatmentBaseTask taskAttributing](self, "taskAttributing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%@,%@,%@,r:%d>"), v4, v6, v7, v9, -[TRIFetchTreatmentTask retryCount](self, "retryCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchTreatmentTask)initWithCoder:(id)a3
{
  id v4;
  TRIFetchTreatmentTask *v5;
  void *v6;
  TRIFetchTreatmentTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchTreatmentTask;
  v5 = -[TRIFetchTreatmentTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIFetchTreatmentTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFetchTreatmentTask.m"), 936, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIFetchTreatmentTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityModifier, 0);
}

@end
