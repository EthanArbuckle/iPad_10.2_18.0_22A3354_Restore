@implementation PLModelMigrationAction_UpdateDuplicateProcessingState

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v6 = a3;
  -[PLModelMigrationActionCore progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalUnitCount") / 7;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLModelMigrationAction_UpdateDuplicateProcessingState fetchRequestForAudioVideo](self, "fetchRequestForAudioVideo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 2, v8, v9, v6, v10, &v29);
  v12 = v29;

  if (v11 != 1)
    goto LABEL_9;
  -[PLModelMigrationAction_UpdateDuplicateProcessingState fetchRequestForScreenshot](self, "fetchRequestForScreenshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 4, v8, v9, v6, v13, &v28);
  v14 = v28;

  if (v11 != 1)
    goto LABEL_8;
  -[PLModelMigrationAction_UpdateDuplicateProcessingState fetchRequestForAnimated](self, "fetchRequestForAnimated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v14;
  v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 8, v8, v9, v6, v15, &v27);
  v12 = v27;

  if (v11 != 1)
    goto LABEL_9;
  -[PLModelMigrationAction_UpdateDuplicateProcessingState fetchRequestForExposureScore](self, "fetchRequestForExposureScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v12;
  v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 32, v8, v9, v6, v16, &v26);
  v14 = v26;

  if (v11 == 1)
  {
    -[PLModelMigrationAction_UpdateDuplicateProcessingState fetchRequestForDocument](self, "fetchRequestForDocument");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState updateSceneClassificationDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:](self, "updateSceneClassificationDuplicateProcessingStateWithProcessingState:pendingParentUnitCount:assetProcessingStateMap:context:request:error:", 16, v8, v9, v6, v17, &v25);
    v12 = v25;

    if (v11 == 1)
    {
      if (objc_msgSend(v9, "count"))
      {
        v18 = (void *)MEMORY[0x19AEC1554]();
        v24 = v12;
        v11 = -[PLModelMigrationAction_UpdateDuplicateProcessingState processAssetStateMap:pendingParentUnitCount:context:error:](self, "processAssetStateMap:pendingParentUnitCount:context:error:", v9, v8, v6, &v24);
        v19 = v24;

        objc_autoreleasePoolPop(v18);
        v12 = v19;
      }
      else
      {
        v11 = 1;
      }
    }
  }
  else
  {
LABEL_8:
    v12 = v14;
  }
LABEL_9:
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v20 = v12;
  v21 = v20;
  if (v11 != 1 && a4 != 0)
    *a4 = objc_retainAutorelease(v20);

  return v11;
}

- (id)fetchRequestForAudioVideo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(v2, "setResultType:", 1);
  return v2;
}

- (id)fetchRequestForScreenshot
{
  void *v2;
  void *v3;

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kindSubtype"), 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setResultType:", 1);
  return v2;
}

- (id)fetchRequestForAnimated
{
  void *v2;
  void *v3;

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("playbackStyle"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setResultType:", 1);
  return v2;
}

- (id)fetchRequestForExposureScore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lf"), CFSTR("mediaAnalysisAttributes.exposureScore"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v7);

  objc_msgSend(v2, "setResultType:", 1);
  return v2;
}

- (id)fetchRequestForDocument
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[PLSceneClassification fetchRequest](PLSceneClassification, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0CB3880];
  +[PLSceneClassification PLJunkSceneClassificationIDForLabel:](PLSceneClassification, "PLJunkSceneClassificationIDForLabel:", CFSTR("hier_text_document"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("sceneIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %lf"), CFSTR("confidence"), 0x3FE2E147AE147AE1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v9);

  v12 = CFSTR("assetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(v2, "setFetchBatchSize:", 100);
  return v2;
}

- (int64_t)processAssetStateMap:(id)a3 pendingParentUnitCount:(int64_t)a4 context:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  __int128 *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  id v39;
  __int128 *v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  int64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  int64_t v49;
  uint64_t v51;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  PLModelMigrationAction_UpdateDuplicateProcessingState *v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  PLModelMigrationAction_UpdateDuplicateProcessingState *v63;
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  id *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  id v83;
  __int16 v84;
  uint64_t v85;
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
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  const __CFString *v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v59 = a5;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 1;
  v72 = 0;
  v73 = (id *)&v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__21263;
  v76 = __Block_byref_object_dispose__21264;
  v77 = 0;
  v54 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58 = self;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v119, 16);
  if (v9)
  {
    v55 = *(_QWORD *)v69;
    do
    {
      v10 = 0;
      v56 = v9;
      do
      {
        if (*(_QWORD *)v69 != v55)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(obj, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPredicate:", v15);

        v118 = CFSTR("additionalAttributes");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v16);

        objc_msgSend(v14, "setFetchBatchSize:", 100);
        v17 = v73 + 5;
        v67 = v73[5];
        objc_msgSend(v59, "executeFetchRequest:error:", v14, &v67);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v17, v67);
        if (objc_msgSend(v18, "count"))
        {
          -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](v58, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v18, "count"), a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __115__PLModelMigrationAction_UpdateDuplicateProcessingState_processAssetStateMap_pendingParentUnitCount_context_error___block_invoke;
          v61[3] = &unk_1E36663C0;
          v61[4] = v11;
          v62 = v54;
          v63 = v58;
          v65 = &v72;
          v66 = &v78;
          v20 = v19;
          v64 = v20;
          objc_msgSend(v59, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v18, v61);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          v23 = v79[3];
          if (v23 != 2 && v21)
          {
            objc_storeStrong(v73 + 5, v21);
            v79[3] = 3;
            goto LABEL_19;
          }
          if (v23 == 1)
          {
            -[PLModelMigrationActionCore logger](v58, "logger");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              PLMigrationGetLog();
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

              if (v26)
              {
                v116 = 0u;
                v117 = 0u;
                v114 = 0u;
                v115 = 0u;
                v112 = 0u;
                v113 = 0u;
                v110 = 0u;
                v111 = 0u;
                v108 = 0u;
                v109 = 0u;
                v106 = 0u;
                v107 = 0u;
                v104 = 0u;
                v105 = 0u;
                v102 = 0u;
                v103 = 0u;
                v100 = 0u;
                v101 = 0u;
                v98 = 0u;
                v99 = 0u;
                v96 = 0u;
                v97 = 0u;
                v94 = 0u;
                v95 = 0u;
                v92 = 0u;
                v93 = 0u;
                v90 = 0u;
                v91 = 0u;
                v88 = 0u;
                v89 = 0u;
                v86 = 0u;
                v87 = 0u;
                PLMigrationGetLog();
                v27 = objc_claimAutoreleasedReturnValue();
                os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
                v28 = (objc_class *)objc_opt_class();
                NSStringFromClass(v28);
                v29 = (id)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v18, "count");
                v82 = 138543618;
                v83 = v29;
                v84 = 2050;
                v85 = v30;
                LODWORD(v51) = 22;
                v31 = (__int128 *)_os_log_send_and_compose_impl();

                -[PLModelMigrationActionCore logger](v58, "logger", &v82, v51);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "logWithMessage:fromCodeLocation:type:", v31, "PLModelMigrationActions_16000.m", 1316, 0);

                if (v31 != &v86)
                  free(v31);
              }
              LODWORD(v24) = 0;
            }
            LOBYTE(v33) = 1;
LABEL_25:

            if (!v33)
              goto LABEL_27;
            goto LABEL_26;
          }
LABEL_19:
          -[PLModelMigrationActionCore logger](v58, "logger");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            PLMigrationGetLog();
            v35 = objc_claimAutoreleasedReturnValue();
            v33 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

            if (v33)
            {
              v116 = 0u;
              v117 = 0u;
              v114 = 0u;
              v115 = 0u;
              v112 = 0u;
              v113 = 0u;
              v110 = 0u;
              v111 = 0u;
              v108 = 0u;
              v109 = 0u;
              v106 = 0u;
              v107 = 0u;
              v104 = 0u;
              v105 = 0u;
              v102 = 0u;
              v103 = 0u;
              v100 = 0u;
              v101 = 0u;
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              v88 = 0u;
              v89 = 0u;
              v86 = 0u;
              v87 = 0u;
              PLMigrationGetLog();
              v36 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v73[5];
              v82 = 138543618;
              v83 = v38;
              v84 = 2114;
              v85 = (uint64_t)v39;
              LODWORD(v51) = 22;
              v40 = (__int128 *)_os_log_send_and_compose_impl();

              -[PLModelMigrationActionCore logger](v58, "logger", &v82, v51);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_16000.m", 1318, 16);

              if (v40 != &v86)
                free(v40);
              goto LABEL_23;
            }
          }
          else
          {
LABEL_23:
            LOBYTE(v33) = 0;
          }
          LODWORD(v24) = 2;
          goto LABEL_25;
        }
        if (!v18)
          v79[3] = 3;
LABEL_26:
        LODWORD(v24) = 0;
LABEL_27:

        objc_autoreleasePoolPop(v12);
        if ((_DWORD)v24)
          goto LABEL_30;
        ++v10;
      }
      while (v56 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v119, 16);
    }
    while (v9);
  }
LABEL_30:

  if (v79[3] == 1 && objc_msgSend(v54, "count"))
  {
    +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setPredicate:", v43);

    objc_msgSend(v42, "setFetchBatchSize:", 100);
    v44 = v73 + 5;
    v60 = v73[5];
    v45 = +[PLModelMigrationActionUtility removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:](PLModelMigrationActionUtility, "removeFromDuplicatesWithAction:managedObjectContext:fetchRequest:requiresTokenReset:error:", v58, v59, v42, 1, &v60);
    objc_storeStrong(v44, v60);
    v79[3] = v45;

  }
  v46 = v79[3];
  v47 = v73[5];
  v48 = v47;
  if (v46 != 1 && a6)
    *a6 = objc_retainAutorelease(v47);

  v49 = v79[3];
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  return v49;
}

- (int64_t)updateSceneClassificationDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  uint64_t v36;
  _OWORD *v37;
  void *v38;
  int64_t v39;
  uint64_t v41;
  PLModelMigrationAction_UpdateDuplicateProcessingState *v42;
  void *v43;
  void *context;
  id v45;
  id v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  int v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  int v59;
  _OWORD v60[32];
  _BYTE v61[128];
  uint64_t v62;

  v12 = a3;
  v62 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v53 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v16, &v53);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v53;
  if (objc_msgSend(v17, "count"))
  {
    v45 = v18;
    v46 = v16;
    v47 = v15;
    v48 = v14;
    context = (void *)MEMORY[0x19AEC1554]();
    v42 = self;
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v17, "count"), a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v20 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v50 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "assetAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "asset");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            objc_msgSend(v19, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v22);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v48;
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v19, v28);

    -[PLModelMigrationActionCore logger](v42, "logger");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

      if (v32)
      {
        memset(v60, 0, sizeof(v60));
        PLMigrationGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v20, "count");
        v54 = 138543874;
        v55 = v35;
        v56 = 2050;
        v57 = v36;
        v58 = 1024;
        v59 = v12;
        LODWORD(v41) = 28;
        v37 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](v42, "logger", &v54, v41);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActions_16000.m", 1351, 0);

        if (v37 != v60)
          free(v37);
      }
    }
    objc_msgSend(v43, "setCompletedUnitCount:", objc_msgSend(v43, "totalUnitCount"));

    objc_autoreleasePoolPop(context);
    v39 = 1;
    v16 = v46;
    v15 = v47;
    v18 = v45;
  }
  else if (v17)
  {
    v39 = 1;
  }
  else
  {
    if (a8)
      *a8 = objc_retainAutorelease(v18);
    v39 = 3;
  }

  return v39;
}

- (PLModelMigrationAction_UpdateDuplicateProcessingState)updateDuplicateProcessingStateWithProcessingState:(unsigned __int16)a3 pendingParentUnitCount:(int64_t)a4 assetProcessingStateMap:(id)a5 context:(id)a6 request:(id)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  void *context;
  id v36;
  id v37;
  int v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  _OWORD v44[32];
  uint64_t v45;

  v12 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v37 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v16, &v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v37;
  if (objc_msgSend(v17, "count"))
  {
    v36 = v18;
    context = (void *)MEMORY[0x19AEC1554]();
    -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v17, "count"), a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        memset(v44, 0, sizeof(v44));
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v17, "count");
        v38 = 138543874;
        v39 = v28;
        v40 = 2050;
        v41 = v29;
        v42 = 1024;
        v43 = v12;
        LODWORD(v34) = 28;
        v30 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v38, v34);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActions_16000.m", 1371, 0);

        if (v30 != v44)
          free(v30);
      }
    }
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "totalUnitCount"));

    objc_autoreleasePoolPop(context);
    v32 = 1;
    v18 = v36;
  }
  else if (v17)
  {
    v32 = 1;
  }
  else
  {
    if (a8)
      *a8 = objc_retainAutorelease(v18);
    v32 = 3;
  }

  return (PLModelMigrationAction_UpdateDuplicateProcessingState *)v32;
}

+ (int64_t)actionProgressWeight
{
  return 300;
}

@end
