@implementation TRIPostUpgradeCleanupTask

- (int)taskType
{
  return 14;
}

+ (id)task
{
  return (id)objc_opt_new();
}

- (id)_nextTasksForRunStatus:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[NSMutableSet allObjects](self->_invalidExperimentDeployments, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[NSMutableSet allObjects](self->_invalidBMLTDeployments, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  return v4;
}

id __52__TRIPostUpgradeCleanupTask__nextTasksForRunStatus___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "deploymentId");

  +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v3, v4, 1, 5, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

TRIDeactivateBMLTDeploymentTask *__52__TRIPostUpgradeCleanupTask__nextTasksForRunStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:triggerEvent:](TRIDeactivateBMLTDeploymentTask, "taskWithBMLTDeployment:triggerEvent:", a2, 6);
}

- (BOOL)_validateRolloutDescriptorsWithNamespaceCompatibilityVersions:(id)a3 usingPaths:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t i;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TRIClientTreatmentStorage *v19;
  void *v20;
  void *v21;
  TRIFBClientTreatmentStorage *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  __int128 v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(v4, "namespaceDescriptorsRolloutDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorsForDirectory:filterBlock:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v34)
  {
    v9 = *(_QWORD *)v36;
    v10 = 1;
    v11 = "TrialXP";
    *(_QWORD *)&v8 = 138543362;
    v31 = v8;
    v32 = *(_QWORD *)v36;
    while (1)
    {
      for (i = 0; i != v34; ++i)
      {
        v13 = v11;
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0DC0AD8];
        objc_msgSend(v14, "namespaceName", v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "namespaceDescriptorsDefaultDir");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loadWithNamespaceName:fromDirectory:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v13;
        if ((_os_feature_enabled_impl() & 1) == 0)
        {
          v19 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v4);
          objc_msgSend(v14, "namespaceName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "upgradeNCVs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v10 &= -[TRIClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v19, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v20, v21);

          v11 = v13;
        }
        if (_os_feature_enabled_impl())
        {
          v22 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", v4);
          objc_msgSend(v14, "namespaceName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "upgradeNCVs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[TRIFBClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v22, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v23, v24);

          v11 = v13;
          v26 = _os_feature_enabled_impl();
          if ((v25 & 1) == 0)
          {
            TRILogCategory_Server();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v26)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "namespaceName");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v31;
                v40 = v29;
                _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", buf, 0xCu);
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v14, "namespaceName");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v31;
              v40 = v29;
              _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_INFO, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", buf, 0xCu);
LABEL_15:

            }
            v11 = v13;
          }
          if (v26)
            v10 = v25;

          v9 = v32;
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (!v34)
        goto LABEL_24;
    }
  }
  LOBYTE(v10) = 1;
LABEL_24:

  return v10 & 1;
}

- (BOOL)_validateExperimentDescriptorsWithNamespaceCompatibilityVersions:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *invalidExperimentDeployments;
  id v10;
  _QWORD v12[4];
  id v13;
  TRIPostUpgradeCleanupTask *v14;

  v6 = a3;
  v7 = a4;
  v8 = (NSMutableSet *)objc_opt_new();
  invalidExperimentDeployments = self->_invalidExperimentDeployments;
  self->_invalidExperimentDeployments = v8;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__TRIPostUpgradeCleanupTask__validateExperimentDescriptorsWithNamespaceCompatibilityVersions_database___block_invoke;
  v12[3] = &unk_1E9330B50;
  v13 = v6;
  v14 = self;
  v10 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "enumerateExperimentRecordsWithBlock:", v12);

  return (char)v6;
}

void __103__TRIPostUpgradeCleanupTask__validateExperimentDescriptorsWithNamespaceCompatibilityVersions_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "namespaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138543362;
    v21 = v6;
    v9 = &OBJC_IVAR___TRITargetingTask_wasDeferred;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(v11, "name", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (!objc_msgSend(v3, "deploymentEnvironment"))
          {
            v15 = objc_msgSend(v11, "compatibilityVersion");
            if (v15 != objc_msgSend(v14, "unsignedIntValue"))
              goto LABEL_13;
          }
        }
        else
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            TRILoggedNamespaceName(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v27 = v20;
            _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "unknown system namespace compatibility version for namespace %{public}@", buf, 0xCu);

            v9 = &OBJC_IVAR___TRITargetingTask_wasDeferred;
          }

          if (!objc_msgSend(v3, "deploymentEnvironment"))
          {
LABEL_13:
            v17 = *(void **)(*(_QWORD *)(a1 + 40) + v9[59]);
            objc_msgSend(v3, "experimentDeployment");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v18);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

}

- (BOOL)_validateDynamicNamespaceRolloutsWithDatabase:(id)a3 usingPaths:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__TRIPostUpgradeCleanupTask__validateDynamicNamespaceRolloutsWithDatabase_usingPaths___block_invoke;
  v10[3] = &unk_1E9331388;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  if (objc_msgSend(v5, "enumerateDynamicNamespaceRecordsWithBlock:", v10))
    v8 = *((_BYTE *)v14 + 24) != 0;
  else
    v8 = 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __86__TRIPostUpgradeCleanupTask__validateDynamicNamespaceRolloutsWithDatabase_usingPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  TRIClientTreatmentStorage *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  TRIFBClientTreatmentStorage *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "appContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathsForContainer:asClientProcess:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = _os_feature_enabled_impl();
    if ((v7 & 1) == 0)
    {
      v8 = -[TRIClientTreatmentStorage initWithPaths:]([TRIClientTreatmentStorage alloc], "initWithPaths:", v6);
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[TRIClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v8, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v9, 0);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v11 + 24))
        v12 = v10;
      else
        v12 = 0;
      *(_BYTE *)(v11 + 24) = v12;

    }
    if (!_os_feature_enabled_impl())
      goto LABEL_22;
    v13 = -[TRIFBClientTreatmentStorage initWithPaths:]([TRIFBClientTreatmentStorage alloc], "initWithPaths:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TRIFBClientTreatmentStorage removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:](v13, "removeTreatmentFromLayer:withNamespaceName:upgradeNCVs:", 2, v14, 0);

    if (v15)
    {
      if (!v7)
        goto LABEL_21;
    }
    else
    {
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (!v7)
      {
        if (v20)
        {
          objc_msgSend(v3, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543362;
          v30 = v28;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", (uint8_t *)&v29, 0xCu);

        }
        goto LABEL_21;
      }
      if (v20)
      {
        objc_msgSend(v3, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v27;
        _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "flatbuffer storage removal of treatment did not succeed for namespace:%{public}@", (uint8_t *)&v29, 0xCu);

      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
LABEL_21:

LABEL_22:
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B18]), "initWithPaths:", v6);
    objc_msgSend(v3, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject statusForNamespaceWithName:](v16, "statusForNamespaceWithName:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && v22)
    {
      v23 = (void *)objc_msgSend(v22, "copyWithReplacementLastFetchAttempt:", 0);

      v22 = (void *)objc_msgSend(v23, "copyWithReplacementLastFetchWasSuccess:", 0);
      v24 = -[NSObject saveStatus:](v16, "saveStatus:", v22);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v25 + 24))
        v26 = v24;
      else
        v26 = 0;
      *(_BYTE *)(v25 + 24) = v26;
    }

    goto LABEL_29;
  }
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "appContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v18;
    _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Skipping validation of rollout content in missing app container: %{public}@", (uint8_t *)&v29, 0xCu);

  }
LABEL_29:

}

- (BOOL)_validateRolloutNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  TRIPostUpgradeCleanupTask *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  objc_msgSend(v10, "rolloutDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke;
  v16[3] = &unk_1E932F4C0;
  v12 = v10;
  v17 = v12;
  v18 = self;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = &v22;
  objc_msgSend(v11, "writeTransactionWithFailableBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return (char)v11;
}

uint64_t __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  unsigned __int8 *v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 *v26;
  uint64_t v28;
  int v29;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  v5 = objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "rolloutDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke_2;
  v40[3] = &unk_1E9330408;
  v7 = *(void **)(a1 + 48);
  v40[4] = *(_QWORD *)(a1 + 40);
  v41 = v7;
  v42 = *(id *)(a1 + 56);
  v8 = (id)v5;
  v43 = v8;
  v34 = v3;
  v9 = objc_msgSend(v6, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 3, v3, v40);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
  if ((v9 & 1) != 0)
  {
    v29 = v9;
    v30 = v8;
    v31 = v4;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v8;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v35)
    {
      v33 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v37 != v33)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          TRILogCategory_Server();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "deployment");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "shortDesc");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v15;
            _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "Post-upgrade task deactivated rollout %{public}@ since it's incompatible with existing NCVs", buf, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "rolloutDatabase");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deployment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "deactivateDeployment:usingTransaction:", v17, v34);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          if (*(_BYTE *)(v19 + 24))
            v20 = v18;
          else
            v20 = 0;
          *(_BYTE *)(v19 + 24) = v20;

          objc_msgSend(v12, "deployment");
          v5 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v5, "rolloutId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "rampId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deployment");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "deploymentId");
          objc_msgSend(v12, "activeFactorPackSetId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v28) = 0;
          +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:](TRITaskUtils, "updateRolloutHistoryDatabaseWithAllocationStatus:forRollout:ramp:deployment:fps:namespaces:telemetryMetric:rolloutRecord:isBecomingObsolete:context:", 4, v21, v22, v24, v25, 0, 0, v12, v28, *(_QWORD *)(a1 + 32));

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v35);
    }

    v8 = v30;
    v4 = v31;
    v10 = (unsigned __int8 *)MEMORY[0x1E0D81680];
    v9 = v29;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v5 = *v10;
  }

  objc_autoreleasePoolPop(v4);
  if (v9)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      v26 = (unsigned __int8 *)MEMORY[0x1E0D81678];
    else
      v26 = v10;
    v5 = *v26;
  }

  return v5;
}

void __80__TRIPostUpgradeCleanupTask__validateRolloutNamespaceNCVs_downloadNCVs_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_activeRolloutIsCompatible:upgradeNCVs:downloadNCVs:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);

}

- (BOOL)_activeRolloutIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5
{
  id v7;
  void *v8;
  char v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id obj;
  char v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *context;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  _BYTE v62[18];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37 = a4;
  v36 = a5;
  v32 = v7;
  objc_msgSend(v7, "artifact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rollout");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v31, "selectedNamespaceArray");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (v38)
  {
    v34 = 0;
    v35 = *(_QWORD *)v54;
    v9 = 1;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = 0;
        v50 = &v49;
        v51 = 0x2020000000;
        v52 = 0;
        v45 = 0;
        v46 = &v45;
        v47 = 0x2020000000;
        v48 = 0;
        objc_msgSend(v11, "compatibilityVersionArray");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __81__TRIPostUpgradeCleanupTask__activeRolloutIsCompatible_upgradeNCVs_downloadNCVs___block_invoke;
        v40[3] = &unk_1E93313B0;
        v17 = v15;
        v41 = v17;
        v43 = &v49;
        v18 = v13;
        v42 = v18;
        v44 = &v45;
        objc_msgSend(v16, "enumerateValuesWithBlock:", v40);

        if (!*((_BYTE *)v50 + 24))
        {
          TRILogCategory_Server();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "deployment");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "shortDesc");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v17, "unsignedIntValue");
            objc_msgSend(v11, "compatibilityVersionArray");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v58 = v20;
            v59 = 2114;
            v60 = v22;
            v61 = 1024;
            *(_DWORD *)v62 = v23;
            *(_WORD *)&v62[4] = 2114;
            *(_QWORD *)&v62[6] = v24;
            _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for rollout %{public}@ is no longer download compatible. Expected NCV: %u Actual: %{public}@", buf, 0x26u);

          }
          v9 = 0;
        }
        if (*((_BYTE *)v46 + 24))
        {
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "deployment");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "shortDesc");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "compatibilityVersionArray");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v58 = v26;
            v59 = 2114;
            v60 = v28;
            v61 = 2112;
            *(_QWORD *)v62 = v18;
            *(_WORD *)&v62[8] = 2114;
            *(_QWORD *)&v62[10] = v29;
            _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for rollout %{public}@ is upgrade compatible. Upgrade NCVs: %@ Namespace NCVs: %{public}@", buf, 0x2Au);

          }
          v34 = 1;
        }

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v49, 8);

        objc_autoreleasePoolPop(context);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    }
    while (v38);
  }
  else
  {
    v34 = 0;
    v9 = 1;
  }

  return (v9 | v34) & 1;
}

void __81__TRIPostUpgradeCleanupTask__activeRolloutIsCompatible_upgradeNCVs_downloadNCVs___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v4 = (void *)a1[4];
  if (v4 && objc_msgSend(v4, "unsignedIntValue") == (_DWORD)a2)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v5 = (void *)a1[5];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
}

- (BOOL)_validateBMLTNamespaceNCVs:(id)a3 downloadNCVs:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *v11;
  NSMutableSet *invalidBMLTDeployments;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (NSMutableSet *)objc_opt_new();
  invalidBMLTDeployments = self->_invalidBMLTDeployments;
  self->_invalidBMLTDeployments = v11;

  objc_msgSend(v10, "bmltDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__TRIPostUpgradeCleanupTask__validateBMLTNamespaceNCVs_downloadNCVs_context___block_invoke;
  v17[3] = &unk_1E93313D8;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v14 = v9;
  v15 = v8;
  LOBYTE(v9) = objc_msgSend(v13, "enumerateActiveTasksWithBlock:", v17);

  return (char)v9;
}

void __77__TRIPostUpgradeCleanupTask__validateBMLTNamespaceNCVs_downloadNCVs_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_activeBMLTIsCompatible:upgradeNCVs:downloadNCVs:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bmltDeployment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDesc");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Post-upgrade task deactivated BMLT %{public}@ since it's incompatible with existing NCVs", (uint8_t *)&v9, 0xCu);

    }
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(v3, "bmltDeployment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (BOOL)_activeBMLTIsCompatible:(id)a3 upgradeNCVs:(id)a4 downloadNCVs:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  _BYTE v60[18];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "artifact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundTask");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hasSelectedNamespace"))
  {
    objc_msgSend(v11, "selectedNamespace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "selectedNamespace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    objc_msgSend(v11, "selectedNamespace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "compatibilityVersionArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __78__TRIPostUpgradeCleanupTask__activeBMLTIsCompatible_upgradeNCVs_downloadNCVs___block_invoke;
    v42[3] = &unk_1E93313B0;
    v20 = v17;
    v43 = v20;
    v45 = &v51;
    v41 = v14;
    v44 = v41;
    v46 = &v47;
    objc_msgSend(v19, "enumerateValuesWithBlock:", v42);

    v40 = *((unsigned __int8 *)v52 + 24);
    if (!*((_BYTE *)v52 + 24))
    {
      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "selectedNamespace");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bmltDeployment");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "shortDesc");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "unsignedIntValue");
        objc_msgSend(v11, "selectedNamespace");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "compatibilityVersionArray");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v36;
        v57 = 2114;
        v58 = v34;
        v59 = 1024;
        *(_DWORD *)v60 = v23;
        *(_WORD *)&v60[4] = 2114;
        *(_QWORD *)&v60[6] = v25;
        _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for BMLT %{public}@ is no longer download compatible. Expected NCV: %u Actual: %{public}@", buf, 0x26u);

      }
    }
    v26 = *((unsigned __int8 *)v48 + 24);
    if (*((_BYTE *)v48 + 24))
    {
      TRILogCategory_Server();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v35 = v20;
        objc_msgSend(v11, "selectedNamespace");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bmltDeployment");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDesc");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectedNamespace");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "compatibilityVersionArray");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v37;
        v57 = 2114;
        v58 = v29;
        v59 = 2112;
        *(_QWORD *)v60 = v41;
        *(_WORD *)&v60[8] = 2114;
        *(_QWORD *)&v60[10] = v31;
        _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Namespace %{public}@ for BMLT %{public}@ is upgrade compatible. Upgrade NCVs: %@ Namespace NCVs: %{public}@", buf, 0x2Au);

        v20 = v35;
      }

    }
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

    v32 = (v26 | v40) != 0;
  }
  else
  {
    v32 = 1;
  }

  return v32;
}

void __78__TRIPostUpgradeCleanupTask__activeBMLTIsCompatible_upgradeNCVs_downloadNCVs___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v4 = (void *)a1[4];
  if (v4 && objc_msgSend(v4, "unsignedIntValue") == (_DWORD)a2)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v5 = (void *)a1[5];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
}

- (BOOL)_removePromotionsUsingPaths:(id)a3
{
  id v3;
  TRINamespaceResolverStorage *v4;

  v3 = a3;
  v4 = -[TRINamespaceResolverStorage initWithPaths:]([TRINamespaceResolverStorage alloc], "initWithPaths:", v3);

  LOBYTE(v3) = -[TRINamespaceResolverStorage removeUnneededPromotionsWithRemovedCount:removeAll:](v4, "removeUnneededPromotionsWithRemovedCount:removeAll:", 0, 1);
  return (char)v3;
}

- (BOOL)_migrateToGlobalAssetStoreIfNeededUsingPaths:(id)a3
{
  id v3;
  TRIRemoteAssetStoreOperator *v4;

  v3 = a3;
  v4 = -[TRIRemoteAssetStoreOperator initWithPaths:]([TRIRemoteAssetStoreOperator alloc], "initWithPaths:", v3);

  LOBYTE(v3) = -[TRIRemoteAssetStoreOperator migrateToGlobalAssetStoreIfNeeded](v4, "migrateToGlobalAssetStoreIfNeeded");
  return (char)v3;
}

- (BOOL)_migrateTreatmentsFolderIfNeededUsingContext:(id)a3
{
  id v3;
  TRIFactorPackSetStorage *v4;
  void *v5;
  TRIFactorPackSetStorage *v6;

  v3 = a3;
  v4 = [TRIFactorPackSetStorage alloc];
  objc_msgSend(v3, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRIFactorPackSetStorage initWithPaths:](v4, "initWithPaths:", v5);

  LOBYTE(v5) = -[TRIFactorPackSetStorage migrateEligibleFactorPacksToGlobalWithServerContext:](v6, "migrateEligibleFactorPacksToGlobalWithServerContext:", v3);
  return (char)v5;
}

- (BOOL)_saveProtoToFlatbufferFormatWithPaths:(id)a3 namespaceUrl:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  TRIFBFactorPackStorage *v36;
  id v37;
  TRIFactorPackStorage *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v5 = a4;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v52 = v7;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Starting rollout migration for namespace: %{private}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[TRIFactorPackStorage initWithPaths:]([TRIFactorPackStorage alloc], "initWithPaths:", v37);
  v36 = -[TRIFBFactorPackStorage initWithPaths:]([TRIFBFactorPackStorage alloc], "initWithPaths:", v37);
  v9 = *MEMORY[0x1E0C999D0];
  v50 = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v8;
  v35 = v5;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (!v13)
  {
    LOBYTE(v40) = 1;
    goto LABEL_25;
  }
  v14 = v13;
  v15 = *(_QWORD *)v46;
  v40 = 1;
  do
  {
    v16 = 0;
    v42 = v14;
    do
    {
      if (*(_QWORD *)v46 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1D8232A5C]();
      v43 = 0;
      v44 = 0;
      v19 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v44, v9, &v43);
      v20 = v44;
      v21 = v43;
      if ((v19 & 1) == 0)
      {
        TRILogCategory_Server();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v21, "localizedDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v52 = v32;
          _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Error while iterating through rollout directory: %@", buf, 0xCu);

        }
        goto LABEL_18;
      }
      if ((objc_msgSend(v20, "BOOLValue") & 1) != 0)
        goto LABEL_19;
      v22 = v15;
      v23 = v12;
      v24 = v9;
      objc_msgSend(v17, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasSuffix:", CFSTR("factorPack.pb"));

      if (v26)
      {
        objc_msgSend(v17, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByDeletingLastPathComponent");
        v28 = objc_claimAutoreleasedReturnValue();

        -[NSObject stringByAppendingPathComponent:](v28, "stringByAppendingPathComponent:", CFSTR("factorPack.fb"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "fileExistsAtPath:", v29) & 1) == 0)
        {
          -[TRIFactorPackStorage loadFactorPackWithDir:](v38, "loadFactorPackWithDir:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "downloadedFactorsWithPaths:", v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 &= -[TRIFBFactorPackStorage saveFactorLevelsForFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorLevelsByNamePath:factorLevelsByIdPath:](v36, "saveFactorLevelsForFactorPack:populatingAssetsForFactorNames:aliasToUnaliasMap:factorLevelsByNamePath:factorLevelsByIdPath:", v31, v39, 0, 0, 0);

          }
        }

        v9 = v24;
        v12 = v23;
        v15 = v22;
        v14 = v42;
LABEL_18:

        goto LABEL_19;
      }
      v9 = v24;
      v12 = v23;
      v15 = v22;
      v14 = v42;
LABEL_19:

      objc_autoreleasePoolPop(v18);
      ++v16;
    }
    while (v14 != v16);
    v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v14 = v33;
  }
  while (v33);
LABEL_25:

  return v40 & 1;
}

- (BOOL)_migrateProtobufFactorPacksToFlatbuffersUsingPaths:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  __int128 v23;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_INFO, "Starting flatbuffer migration for rollouts", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "treatmentsDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, 0, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v10, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v14 = (void *)v12;
    v9 = 1;
    *(_QWORD *)&v13 = 134217984;
    v23 = v13;
    v15 = v3;
    do
    {
      objc_msgSend(v14, "lastPathComponent", v23);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        v25 = -1;
        if (objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v16, 10, &v25))
        {
          if ((unint64_t)(v25 - 1) > 0x7FFFFFFE)
          {
            TRILogCategory_Server();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              v27 = v25;
              _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Skipping conversion of protobuf for unrecognized id:%lld", buf, 0xCu);
            }
          }
          else
          {
            TRINamespace_NamespaceId_EnumDescriptor();
            v18 = objc_claimAutoreleasedReturnValue();
            -[NSObject textFormatNameForValue:](v18, "textFormatNameForValue:", v25);
            v19 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v19;
            v15 = v3;
          }

        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRIAL_SYSTEM")) & 1) == 0)
          v9 &= -[TRIPostUpgradeCleanupTask _saveProtoToFlatbufferFormatWithPaths:namespaceUrl:](self, "_saveProtoToFlatbufferFormatWithPaths:namespaceUrl:", v15, v14);

      }
      objc_autoreleasePoolPop(v11);
      v11 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v10, "nextObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v14);
  }
  else
  {
    v15 = v3;
  }
  objc_autoreleasePoolPop(v11);
  TRILogCategory_Server();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = "failure";
    if ((v9 & 1) != 0)
      v21 = "success";
    *(_DWORD *)buf = 136315138;
    v27 = (uint64_t)v21;
    _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "Flatbuffer migration for rollouts completed with status %s", buf, 0xCu);
  }

  return v9 & 1;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  TRIAssetStore *v32;
  void *v33;
  TRIAssetStore *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  TRIPostUpgradeCleanupTask *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v39 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC0AD8];
  v40 = v4;
  objc_msgSend(v4, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "namespaceDescriptorsDefaultDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptorsForDirectory:filterBlock:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "downloadNCV", v39));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "namespaceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v18);

        objc_msgSend(v16, "upgradeNCVs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "namespaceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v13);
  }

  objc_msgSend(v40, "paths");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TRIPostUpgradeCleanupTask _validateRolloutDescriptorsWithNamespaceCompatibilityVersions:usingPaths:](v39, "_validateRolloutDescriptorsWithNamespaceCompatibilityVersions:usingPaths:", v9, v21);

  objc_msgSend(v40, "experimentDatabase");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 & -[TRIPostUpgradeCleanupTask _validateExperimentDescriptorsWithNamespaceCompatibilityVersions:database:](v39, "_validateExperimentDescriptorsWithNamespaceCompatibilityVersions:database:", v9, v23);

  objc_msgSend(v40, "namespaceDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "paths");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = -[TRIPostUpgradeCleanupTask _validateDynamicNamespaceRolloutsWithDatabase:usingPaths:](v39, "_validateDynamicNamespaceRolloutsWithDatabase:usingPaths:", v25, v26);

  v28 = v24 & v27 & -[TRIPostUpgradeCleanupTask _validateRolloutNamespaceNCVs:downloadNCVs:context:](v39, "_validateRolloutNamespaceNCVs:downloadNCVs:context:", v10, v9, v40);
  objc_msgSend(v40, "paths");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = -[TRIPostUpgradeCleanupTask _removePromotionsUsingPaths:](v39, "_removePromotionsUsingPaths:", v29);

  v30 = v28 & v26 & -[TRIPostUpgradeCleanupTask _validateBMLTNamespaceNCVs:downloadNCVs:context:](v39, "_validateBMLTNamespaceNCVs:downloadNCVs:context:", v10, v9, v40);
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    objc_msgSend(v40, "paths");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v30 &= -[TRIPostUpgradeCleanupTask _migrateProtobufFactorPacksToFlatbuffersUsingPaths:](v39, "_migrateProtobufFactorPacksToFlatbuffersUsingPaths:", v31);

  }
  v32 = [TRIAssetStore alloc];
  objc_msgSend(v40, "paths");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[TRIAssetStore initWithPaths:](v32, "initWithPaths:", v33);

  -[TRIAssetStore fixFileProtectionForAssetStoreFiles](v34, "fixFileProtectionForAssetStoreFiles");
  if (v30)
    v35 = 2;
  else
    v35 = 3;
  -[TRIPostUpgradeCleanupTask _nextTasksForRunStatus:](v39, "_nextTasksForRunStatus:", v35, v39);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", v35, 1, v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)_asPersistedTask
{
  return (id)objc_opt_new();
}

- (id)serialize
{
  void *v4;
  void *v5;
  void *v7;
  objc_class *v8;
  void *v9;

  -[TRIPostUpgradeCleanupTask _asPersistedTask](self, "_asPersistedTask");
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPostUpgradeCleanupTask.m"), 479, CFSTR("Unexpected failure to serialize %@"), v9);

  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPostUpgradeCleanupPersistedTask, "parseFromData:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = (void *)objc_opt_new();
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIPostUpgradeCleanupTask: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPostUpgradeCleanupTask)initWithCoder:(id)a3
{
  id v4;
  TRIPostUpgradeCleanupTask *v5;
  void *v6;
  TRIPostUpgradeCleanupTask *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPostUpgradeCleanupTask;
  v5 = -[TRIPostUpgradeCleanupTask init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pb"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "parseFromData:", v6);
      v7 = (TRIPostUpgradeCleanupTask *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPostUpgradeCleanupTask.m"), 497, CFSTR("Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]."));

  }
  -[TRIPostUpgradeCleanupTask serialize](self, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("pb"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidBMLTDeployments, 0);
  objc_storeStrong((id *)&self->_invalidExperimentDeployments, 0);
}

@end
