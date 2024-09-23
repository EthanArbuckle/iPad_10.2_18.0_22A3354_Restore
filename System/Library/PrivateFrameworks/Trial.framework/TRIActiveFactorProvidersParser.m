@implementation TRIActiveFactorProvidersParser

- (TRIActiveFactorProvidersParser)initWithPaths:(id)a3
{
  id v5;
  TRIActiveFactorProvidersParser *v6;
  TRIActiveFactorProvidersParser *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _PASLock *lock;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TRIActiveFactorProvidersParser;
  v6 = -[TRIActiveFactorProvidersParser init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    v8 = objc_opt_new();
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = 0;

    *(_BYTE *)(v8 + 32) = 0;
    v10 = objc_opt_new();
    v11 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v10;

    v12 = objc_opt_new();
    v13 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v14;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[TRIActiveFactorProvidersParser dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)TRIActiveFactorProvidersParser;
  -[TRIActiveFactorProvidersParser dealloc](&v3, sel_dealloc);
}

- (void)dispose
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_20);
}

uint64_t __41__TRIActiveFactorProvidersParser_dispose__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void *v4;

  v2 = (void *)a2[2];
  v3 = a2;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_64);
  v4 = (void *)v3[3];

  return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_66);
}

void __41__TRIActiveFactorProvidersParser_dispose__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "lock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

}

void __41__TRIActiveFactorProvidersParser_dispose__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "lock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

}

- (id)resolvePropertyListFactorProviderChainForNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  NSObject *v24;
  void *v25;
  TRIRolloutDeployment *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  TRITypedFactorProvider *v33;
  TRITypedFactorProvider *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  TRIExperimentDeployment *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  TRIExperimentDeployment *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  TRITypedFactorProvider *v49;
  TRITypedFactorProvider *v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned int v65;
  unsigned int v66;
  NSObject *v67;
  id v68;
  void *v69;
  TRIExperimentDeployment *v70;
  TRIRolloutDeployment *v71;
  void *v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  _BYTE buf[12];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v84 = 0;
  -[TRIActiveFactorProvidersParser _resolverPropertyListWithResolvedPath:](self, "_resolverPropertyListWithResolvedPath:", &v84);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namespaceMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rolloutV2Deployments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentDeployments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_opt_new();
    v13 = v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentTreatments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = (id)objc_opt_new();
    v17 = v16;

    if (v7
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v13
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v17
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v73 = (void *)objc_opt_new();
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          obj = v18;
          v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
          if (!v75)
            goto LABEL_55;
          v76 = *(_QWORD *)v81;
          v77 = v13;
          v78 = v17;
          while (1)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v81 != v76)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v19);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v20, "count") != 2)
              {
                v58 = objc_alloc(MEMORY[0x1E0CB3940]);
                v24 = objc_msgSend(v58, "initWithFormat:", CFSTR("plplist contains bad provider chain: %@"), v84);
                -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v24);
LABEL_62:
                v13 = v77;
LABEL_63:

                v12 = (void *)MEMORY[0x1E0C9AA60];
                v17 = v78;
                v54 = v73;
                goto LABEL_64;
              }
              v79 = v19;
              objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(CFSTR("rolloutV2"), "isEqual:", v21) & 1) != 0)
              {
                objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
                  v24 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "objectForKeyedSubscript:", v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    v59 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v60 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("plplist contains bad rollout deployment: %@"), v84);
                    -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v60);

                    goto LABEL_62;
                  }
                  v26 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", v24, objc_msgSend(v25, "intValue"));
                  -[TRIActiveFactorProvidersParser resolveTargetedFactorPackSetForRolloutDeployment:](self, "resolveTargetedFactorPackSetForRolloutDeployment:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v27)
                  {
                    v67 = v24;
                    *(_QWORD *)buf = 0;
                    v28 = v27;
                    -[TRIRolloutDeployment rolloutId](v26, "rolloutId");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = v26;
                    v65 = -[TRIRolloutDeployment deploymentId](v26, "deploymentId");
                    v69 = v28;
                    objc_msgSend(v28, "path");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TRIActiveFactorProvidersParser factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:](self, "factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:", v4, v29, v65, 0, v30, buf);
                    v31 = objc_claimAutoreleasedReturnValue();

                    v32 = (void *)v31;
                    if (v31)
                    {
                      v33 = [TRITypedFactorProvider alloc];
                      v34 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v33, "initWithType:provider:logDesc:", 2, v31, *(_QWORD *)buf);
                      objc_msgSend(v73, "addObject:", v34);

                    }
                    v27 = v69;
                    v26 = v71;
                    v24 = v67;
                  }

                  goto LABEL_50;
                }
              }
              else
              {

              }
              objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(CFSTR("experiment"), "isEqual:", v35) & 1) == 0)
              {

LABEL_49:
                v51 = objc_alloc(MEMORY[0x1E0CB3940]);
                v24 = objc_msgSend(v51, "initWithFormat:", CFSTR("plplist at %@ contains unsupported provider chain element: %@"), v84, v20);
                -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v24);
                goto LABEL_50;
              }
              objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v37 = objc_opt_isKindOfClass();

              if ((v37 & 1) == 0)
                goto LABEL_49;
              if (_os_feature_enabled_impl())
              {
                objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
                v24 = objc_claimAutoreleasedReturnValue();
                v13 = v77;
                objc_msgSend(v77, "objectForKeyedSubscript:", v24);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v61 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v62 = (void *)objc_msgSend(v61, "initWithFormat:", CFSTR("plplist contains bad experiment deployment: %@"), v84);
                  -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v62);

                  goto LABEL_63;
                }
                objc_msgSend(v78, "objectForKeyedSubscript:", v24);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("plplist contains experiment deployment with bad treatment ID: %@"), v39);
                  -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v63);

                  goto LABEL_62;
                }
                v40 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:]([TRIExperimentDeployment alloc], "initWithExperimentId:deploymentId:", v24, objc_msgSend(v38, "intValue"));
                -[TRIActiveFactorProvidersParser resolveTargetedFactorPackSetForExperimentDeployment:](self, "resolveTargetedFactorPackSetForExperimentDeployment:", v40);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                {
                  v72 = v38;
                  *(_QWORD *)buf = 0;
                  v42 = v41;
                  -[TRIExperimentDeployment experimentId](v40, "experimentId");
                  v43 = objc_claimAutoreleasedReturnValue();
                  v44 = v40;
                  v45 = v43;
                  v64 = (void *)v43;
                  v70 = v44;
                  v66 = -[TRIExperimentDeployment deploymentId](v44, "deploymentId");
                  v68 = v42;
                  objc_msgSend(v42, "path");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIActiveFactorProvidersParser factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:](self, "factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:", v4, v45, v66, v39, v46, buf);
                  v47 = objc_claimAutoreleasedReturnValue();

                  v48 = (void *)v47;
                  if (v47)
                  {
                    v49 = [TRITypedFactorProvider alloc];
                    v50 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v49, "initWithType:provider:logDesc:", 32, v47, *(_QWORD *)buf);
                    objc_msgSend(v73, "addObject:", v50);

                  }
                  v40 = v70;
                  v38 = v72;
                  v41 = v68;
                }

              }
              else
              {
                TRILogCategory_ClientFramework();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v52;
                  _os_log_debug_impl(&dword_19B89C000, v24, OS_LOG_TYPE_DEBUG, "Ignoring FPS-based experiment deployment info in plplist as the feature is not yet enabled: %@", buf, 0xCu);

                }
              }
LABEL_50:

              v17 = v78;
              v19 = v79 + 1;
              v13 = v77;
            }
            while (v75 != v79 + 1);
            v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
            v75 = v53;
            if (!v53)
            {
LABEL_55:

              v54 = v73;
              v12 = v54;
              goto LABEL_64;
            }
          }
        }
        v57 = objc_alloc(MEMORY[0x1E0CB3940]);
        v54 = (id)objc_msgSend(v57, "initWithFormat:", CFSTR("plplist contains non-array provider chain: %@"), v84);
        -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v54);
        v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_64:

        goto LABEL_58;
      }
    }
    else
    {
      v55 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("plplist contains unexpected toplevel content: %@"), v84);
      -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v18);
    }
    v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_58:

    goto LABEL_59;
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_59:

  return v12;
}

- (id)resolvePropertyListGlobalFactorProviderChainForNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  TRIRolloutDeployment *v28;
  void *v29;
  TRITypedFactorProvider *v30;
  TRITypedFactorProvider *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  TRIExperimentDeployment *v36;
  void *v37;
  TRITypedFactorProvider *v38;
  TRITypedFactorProvider *v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  TRIExperimentDeployment *v55;
  TRIRolloutDeployment *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  id obj;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char isKindOfClass;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  os_log_t log;
  NSObject *loga;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _BYTE buf[12];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v80 = 0;
  -[TRIActiveFactorProvidersParser _resolverPropertyListWithResolvedPath:](self, "_resolverPropertyListWithResolvedPath:", &v80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("namespaceMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("namespaceFactorPackMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rolloutV2Deployments"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentDeployments"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v14 = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experimentTreatments"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (id)objc_opt_new();
    v18 = v17;

    if (v7
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v9
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v8
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v14
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && v18
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = (void *)objc_opt_new();
          objc_msgSend(v8, "objectForKeyedSubscript:", v4);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
          {
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            obj = v19;
            v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
            if (!v64)
              goto LABEL_56;
            v66 = *(_QWORD *)v77;
            v67 = v20;
            v65 = v18;
            while (1)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v77 != v66)
                {
                  v22 = v21;
                  objc_enumerationMutation(obj);
                  v21 = v22;
                }
                v73 = v21;
                v23 = *(os_log_t *)(*((_QWORD *)&v76 + 1) + 8 * v21);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || -[NSObject count](v23, "count") != 2)
                {
                  v47 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v48 = objc_msgSend(v47, "initWithFormat:", CFSTR("plplist contains bad provider chain: %@"), v80);
                  -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v48);
                  v18 = v65;
LABEL_68:

                  v13 = (id)MEMORY[0x1E0C9AA60];
                  v20 = v67;
                  goto LABEL_69;
                }
                -[NSObject objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                log = v23;
                if ((objc_msgSend(CFSTR("rolloutV2"), "isEqual:", v24) & 1) != 0)
                {
                  -[NSObject objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 1);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();

                  v23 = log;
                  v18 = v65;
                  if ((isKindOfClass & 1) != 0)
                  {
                    -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", 1);
                    loga = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "objectForKeyedSubscript:");
                    v26 = objc_claimAutoreleasedReturnValue();
                    v59 = (void *)v26;
                    if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      v49 = objc_alloc(MEMORY[0x1E0CB3940]);
                      v50 = (void *)objc_msgSend(v49, "initWithFormat:", CFSTR("plplist contains bad rollout deployment: %@"), v80);
                      -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v50);

                      v51 = v59;
LABEL_67:

                      v48 = loga;
                      goto LABEL_68;
                    }
                    v28 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", loga, objc_msgSend(v27, "intValue"));
                    *(_QWORD *)buf = 0;
                    -[TRIRolloutDeployment rolloutId](v28, "rolloutId");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = v28;
                    -[TRIActiveFactorProvidersParser globalFactorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackId:resolvedPath:](self, "globalFactorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackId:resolvedPath:", v4, v69, -[TRIRolloutDeployment deploymentId](v28, "deploymentId"), 0, v62, buf);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v29)
                    {
                      v30 = [TRITypedFactorProvider alloc];
                      v70 = v29;
                      v31 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v30, "initWithType:provider:logDesc:", 2, v29, *(_QWORD *)buf);
                      objc_msgSend(v67, "addObject:", v31);

                      v29 = v70;
                    }

                    v32 = v59;
LABEL_47:

LABEL_48:
                    v40 = loga;
                    goto LABEL_51;
                  }
                }
                else
                {

                  v18 = v65;
                }
                -[NSObject objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 0);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(CFSTR("experiment"), "isEqual:") & 1) == 0)
                {

LABEL_50:
                  v41 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v40 = objc_msgSend(v41, "initWithFormat:", CFSTR("plplist at %@ contains unsupported provider chain element: %@"), v80, log);
                  -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v40);
                  goto LABEL_51;
                }
                -[NSObject objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", 1);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v60 = objc_opt_isKindOfClass();

                if ((v60 & 1) == 0)
                  goto LABEL_50;
                if (_os_feature_enabled_impl())
                {
                  -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", 1);
                  v34 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectForKeyedSubscript:", v34);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  loga = v34;
                  if (!v72 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    v52 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v53 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("plplist contains bad experiment deployment: %@"), v80);
                    -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v53);

                    v48 = loga;
                    goto LABEL_68;
                  }
                  objc_msgSend(v18, "objectForKeyedSubscript:", v34);
                  v35 = objc_claimAutoreleasedReturnValue();
                  v61 = (void *)v35;
                  if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("plplist contains experiment deployment with bad treatment ID: %@"), v35);
                    -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v54);

                    v51 = v72;
                    goto LABEL_67;
                  }
                  v36 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:]([TRIExperimentDeployment alloc], "initWithExperimentId:deploymentId:", loga, objc_msgSend(v72, "intValue"));
                  *(_QWORD *)buf = 0;
                  -[TRIExperimentDeployment experimentId](v36, "experimentId");
                  v55 = v36;
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[TRIActiveFactorProvidersParser globalFactorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackId:resolvedPath:](self, "globalFactorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackId:resolvedPath:", v4, v57, -[TRIExperimentDeployment deploymentId](v36, "deploymentId"), v61, v62, buf);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v37)
                  {
                    v38 = [TRITypedFactorProvider alloc];
                    v58 = v37;
                    v39 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v38, "initWithType:provider:logDesc:", 32, v37, *(_QWORD *)buf);
                    objc_msgSend(v67, "addObject:", v39);

                    v37 = v58;
                  }

                  v32 = v72;
                  goto LABEL_47;
                }
                TRILogCategory_ClientFramework();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  -[NSObject objectAtIndexedSubscript:](log, "objectAtIndexedSubscript:", 1);
                  loga = v40;
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v42;
                  _os_log_debug_impl(&dword_19B89C000, loga, OS_LOG_TYPE_DEBUG, "Ignoring FPS-based experiment deployment info in plplist as the feature is not yet enabled: %@", buf, 0xCu);

                  goto LABEL_48;
                }
LABEL_51:

                v21 = v73 + 1;
                v20 = v67;
              }
              while (v64 != v73 + 1);
              v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
              v64 = v43;
              if (!v43)
              {
LABEL_56:

                break;
              }
            }
          }
          v13 = v20;
LABEL_69:

        }
        else
        {
          v46 = objc_alloc(MEMORY[0x1E0CB3940]);
          v20 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("plplist contains non-array provider chain: %@"), v80);
          -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v20);
          v13 = (id)MEMORY[0x1E0C9AA60];
        }

        goto LABEL_60;
      }
    }
    else
    {
      v44 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = (void *)objc_msgSend(v44, "initWithFormat:", CFSTR("plplist contains unexpected toplevel content: %@"), v80);
      -[TRIActiveFactorProvidersParser _faultOnceWithMessage:](self, "_faultOnceWithMessage:", v19);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_60:

    goto LABEL_61;
  }
  v13 = (id)MEMORY[0x1E0C9AA60];
LABEL_61:

  return v13;
}

- (id)resolveTargetedFactorPackSetForRolloutDeployment:(id)a3
{
  id v5;
  _PASLock *lock;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  TRIActiveFactorProvidersParser *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForRolloutDeployment___block_invoke;
  v10[3] = &unk_1E3BFFCF0;
  v13 = &v15;
  v7 = v5;
  v11 = v7;
  v12 = self;
  v14 = a2;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __83__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForRolloutDeployment___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  TRIReferenceManagedDirReaderLock *v18;
  TRIReferenceManagedDirReaderLock *v19;
  TRILockedFactorPackSet *v20;
  uint64_t v21;
  void *v22;
  int *v23;
  char *v24;
  int v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  _BYTE v33[1024];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "namespaceDescriptorsDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "rolloutId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("v2/rolloutV2/%@/%d/%@"), v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), CFSTR("targetedFactorPackSet"));
    objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    bzero(v33, 0x400uLL);
    *__error() = 0;
    v12 = *(void **)(a1 + 40);
    v13 = objc_retainAutorelease(v11);
    v14 = objc_msgSend(v12, "_realpathWithFileSystemRepresentation:buffer:", objc_msgSend(v13, "fileSystemRepresentation"), v33);
    if (v14)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRIActiveFactorProvidersParser.m"), 355, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[NSString alloc] initWithUTF8String:expandedPath]"));

      }
      -[NSObject lastPathComponent](v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackSetId(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = -[TRIReferenceManagedDirReaderLock initWithDir:]([TRIReferenceManagedDirReaderLock alloc], "initWithDir:", v15);
        if (v18)
        {
          v19 = v18;
          v20 = -[TRILockedFactorPackSet initWithFactorPackSetId:path:lock:]([TRILockedFactorPackSet alloc], "initWithFactorPackSetId:path:lock:", v17, v15, v18);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          objc_msgSend(v3[2], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
        }
      }

    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      TRILogCategory_ClientFramework();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = __error();
        v24 = strerror(*v23);
        v25 = *__error();
        *(_DWORD *)buf = 138412802;
        v28 = v13;
        v29 = 2080;
        v30 = v24;
        v31 = 1024;
        v32 = v25;
        _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "Unable to resolve rollout deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (id)resolveTargetedFactorPackSetForExperimentDeployment:(id)a3
{
  id v5;
  void *v6;
  _PASLock *lock;
  id v8;
  _QWORD v10[4];
  id v11;
  TRIActiveFactorProvidersParser *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = v5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  if (v5)
  {
    lock = self->_lock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForExperimentDeployment___block_invoke;
    v10[3] = &unk_1E3BFFCF0;
    v13 = &v15;
    v11 = v5;
    v12 = self;
    v14 = a2;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
    v8 = (id)v16[5];

  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __86__TRIActiveFactorProvidersParser_resolveTargetedFactorPackSetForExperimentDeployment___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  TRIReferenceManagedDirReaderLock *v18;
  TRIReferenceManagedDirReaderLock *v19;
  TRILockedFactorPackSet *v20;
  uint64_t v21;
  void *v22;
  int *v23;
  char *v24;
  int v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  _BYTE v33[1024];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "namespaceDescriptorsDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("v2/experiment/%@/%d/%@"), v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), CFSTR("targetedFactorPackSet"));
    objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    bzero(v33, 0x400uLL);
    v12 = *(void **)(a1 + 40);
    v13 = objc_retainAutorelease(v11);
    v14 = objc_msgSend(v12, "_realpathWithFileSystemRepresentation:buffer:", objc_msgSend(v13, "fileSystemRepresentation"), v33);
    if (v14)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRIActiveFactorProvidersParser.m"), 400, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[NSString alloc] initWithUTF8String:expandedPath]"));

      }
      -[NSObject lastPathComponent](v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackSetId(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = -[TRIReferenceManagedDirReaderLock initWithDir:]([TRIReferenceManagedDirReaderLock alloc], "initWithDir:", v15);
        if (v18)
        {
          v19 = v18;
          v20 = -[TRILockedFactorPackSet initWithFactorPackSetId:path:lock:]([TRILockedFactorPackSet alloc], "initWithFactorPackSetId:path:lock:", v17, v15, v18);
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          objc_msgSend(v3[3], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
        }
      }

    }
    else
    {
      if (*__error() == 2)
      {
LABEL_13:

        goto LABEL_14;
      }
      TRILogCategory_ClientFramework();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = __error();
        v24 = strerror(*v23);
        v25 = *__error();
        *(_DWORD *)buf = 138412802;
        v28 = v13;
        v29 = 2080;
        v30 = v24;
        v31 = 1024;
        v32 = v25;
        _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "Unable to resolve experiment deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (id)factorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackSetWithDir:(id)a7 resolvedPath:(id *)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  TRIFPNamespaceFactorProvider *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  TRIFPNamespaceFactorProvider *v31;
  TRIFPNamespaceFactorProvider *v32;
  NSObject *v33;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  stat v44;
  _QWORD v45[4];

  v11 = *(_QWORD *)&a5;
  v45[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v35 = a6;
  v16 = a7;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("factorPacks"), v14);
  objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("legacyNamespaceFactorPacks"), v14);
  objc_msgSend(v16, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v18;
  v45[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceResolver preferredPathForFactorDataWithCandidatePaths:](TRINamespaceResolver, "preferredPathForFactorDataWithCandidatePaths:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *a8;
  *a8 = v22;

  memset(&v44, 0, sizeof(v44));
  if (lstat((const char *)objc_msgSend(objc_retainAutorelease(*a8), "fileSystemRepresentation"), &v44)
    && *__error() == 2)
  {
    TRILogCategory_ClientFramework();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v15;
      v38 = 1024;
      v39 = v11;
      v40 = 2112;
      v41 = v25;
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_19B89C000, v24, OS_LOG_TYPE_DEFAULT, "Deployment %@.%d resolves to factor pack set %@ with no factor pack for %@.", buf, 0x26u);

    }
    v26 = 0;
    v27 = v35;
  }
  else
  {
    buf[0] = 0;
    -[TRIActiveFactorProvidersParser _getFactorPackPathForNamespaceName:withCandidatePath:parentId:deploymentId:promotable:](self, "_getFactorPackPathForNamespaceName:withCandidatePath:parentId:deploymentId:promotable:", v14, *a8, v15, v11, buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *a8;
    *a8 = v28;

    objc_msgSend(*a8, "triStringByResolvingSymlinksInPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [TRIFPNamespaceFactorProvider alloc];
    v27 = v35;
    v32 = -[TRIFPNamespaceFactorProvider initWithPath:parentId:deploymentId:treatmentId:promotable:](v31, "initWithPath:parentId:deploymentId:treatmentId:promotable:", *a8, v15, v11, v35, buf[0]);
    if (!v32)
    {
      TRILogCategory_ClientFramework();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v44.st_dev = 138412290;
        *(_QWORD *)&v44.st_mode = v30;
        _os_log_error_impl(&dword_19B89C000, v33, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", (uint8_t *)&v44, 0xCu);
      }

    }
    v26 = v32;

  }
  return v26;
}

- (id)globalFactorProviderForNamespaceName:(id)a3 parentId:(id)a4 deploymentId:(int)a5 treatmentId:(id)a6 fromFactorPackId:(id)a7 resolvedPath:(id *)a8
{
  uint64_t v10;
  TRIPaths *paths;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  TRIFPNamespaceFactorProvider *v23;
  NSObject *v24;
  NSObject *v25;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v10 = *(_QWORD *)&a5;
  v29 = *MEMORY[0x1E0C80C00];
  paths = self->_paths;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  -[TRIPaths treatmentsDirUsingGlobal:](paths, "treatmentsDirUsingGlobal:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@/%@"), v17, CFSTR("factorPacks"), v14);

  objc_msgSend(v18, "stringByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *a8;
  *a8 = v20;

  objc_msgSend(*a8, "triStringByResolvingSymlinksInPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[TRIFPNamespaceFactorProvider initWithPath:parentId:deploymentId:treatmentId:promotable:]([TRIFPNamespaceFactorProvider alloc], "initWithPath:parentId:deploymentId:treatmentId:promotable:", *a8, v16, v10, v15, 1);

  TRILogCategory_ClientFramework();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_log_impl(&dword_19B89C000, v25, OS_LOG_TYPE_DEFAULT, "Factor provider found path to factor pack: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_error_impl(&dword_19B89C000, v25, OS_LOG_TYPE_ERROR, "Failed to open factor pack: %@", buf, 0xCu);
  }

  return v23;
}

- (id)_resolverPropertyListWithResolvedPath:(id *)a3
{
  void *v5;
  void *v6;
  _PASLock *lock;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  TRIActiveFactorProvidersParser *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[TRIPaths namespaceDescriptorsDir](self->_paths, "namespaceDescriptorsDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("v2/activeFactorProviders.plplist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__TRIActiveFactorProvidersParser__resolverPropertyListWithResolvedPath___block_invoke;
  v13[3] = &unk_1E3BFFD18;
  v8 = v6;
  v14 = v8;
  v15 = self;
  v16 = &v17;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v9 = *a3;
  *a3 = v8;
  v10 = v8;

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __72__TRIActiveFactorProvidersParser__resolverPropertyListWithResolvedPath___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)v3[1];
  if (v4)
    goto LABEL_2;
  *__error() = 0;
  if (access((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), 4))
  {
    if (*__error() == 1)
    {
      v5 = *(void **)(a1 + 40);
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "namespaceDescriptorsDir");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("Cannot access \"%@\" - Please ensure you have set the entitlement <key>com.apple.trial.client</key> to the right value(s)"), v7);
      objc_msgSend(v5, "_faultOnceWithMessage:", v8);

      goto LABEL_3;
    }
    if (*__error() == 2)
    {
      TRILogCategory_ClientFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_DEFAULT, "Namespace resolver file not present: %@", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_3;
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D815D0], "propertyListWithPath:error:", v11, &v16);
  v12 = objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v13 = (void *)v3[1];
  v3[1] = v12;

  if (!v3[1])
  {
    if (!*((_BYTE *)v3 + 32))
    {
      TRILogCategory_ClientFramework();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v9;
        _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "Error opening namespace resolver file \"%@\": %@", buf, 0x16u);
      }

      *((_BYTE *)v3 + 32) = 1;
    }
    goto LABEL_16;
  }

  v4 = (void *)v3[1];
LABEL_2:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
LABEL_3:

}

- (id)_getFactorPackPathForNamespaceName:(id)a3 withCandidatePath:(id)a4 parentId:(id)a5 deploymentId:(int)a6 promotable:(BOOL *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  char v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  unsigned int v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  TRIActiveFactorProvidersParser *v73;
  id v74;
  id v75;
  _QWORD v76[2];
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  *a7 = 1;
  objc_msgSend(v14, "triStringByResolvingSymlinksInPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateFactorPackId(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      TRILogCategory_ClientFramework();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v78 = v17;
        v79 = 2112;
        v80 = v13;
        _os_log_error_impl(&dword_19B89C000, v41, OS_LOG_TYPE_ERROR, "Could not validate factor pack id from \"%@\" for namespace \"%@\", buf, 0x16u);
      }

      v40 = v14;
      goto LABEL_49;
    }
    v65 = a6;
    v69 = v13;
    +[TRINamespaceResolver promotionDirForNamespaceName:withPaths:](TRINamespaceResolver, "promotionDirForNamespaceName:withPaths:", v13, self->_paths);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("provisional.pb"));
    v21 = objc_claimAutoreleasedReturnValue();

    v75 = 0;
    v67 = (void *)v21;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v21, 0, &v75);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v75;
    v24 = v23;
    v68 = (void *)v22;
    if (v22)
    {
      v74 = v23;
      objc_msgSend(MEMORY[0x1E0DC0F68], "parseFromData:error:", v22, &v74);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v74;

      if (!v25)
      {
        TRILogCategory_ClientFramework();
        v46 = objc_claimAutoreleasedReturnValue();
        v45 = v66;
        v42 = v67;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v78 = v67;
          v79 = 2112;
          v80 = v69;
          v81 = 2112;
          v82 = v66;
          _os_log_error_impl(&dword_19B89C000, v46, OS_LOG_TYPE_ERROR, "Error parsing provisional file \"%@\" for namespace \"%@\": %@", buf, 0x20u);
        }

        v40 = v14;
        goto LABEL_47;
      }
      v64 = v15;
      if (!objc_msgSend(v25, "hasFactorPackId")
        || (objc_msgSend(v25, "factorPackId"),
            v63 = v25,
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "isEqualToString:", v19),
            v26,
            v25 = v63,
            (v27 & 1) == 0))
      {
        v40 = v14;
        v15 = v64;
        v45 = v66;
        v42 = v67;
LABEL_47:

        v24 = v45;
        goto LABEL_48;
      }
      v76[0] = CFSTR("promoted");
      v76[1] = CFSTR("legacyPromoted");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __120__TRIActiveFactorProvidersParser__getFactorPackPathForNamespaceName_withCandidatePath_parentId_deploymentId_promotable___block_invoke;
      v71[3] = &unk_1E3BFFD40;
      v62 = v69;
      v72 = v62;
      v73 = self;
      objc_msgSend(v28, "_pas_mappedArrayWithTransform:", v71);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      +[TRINamespaceResolver preferredPathForFactorDataWithCandidatePaths:](TRINamespaceResolver, "preferredPathForFactorDataWithCandidatePaths:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30;
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIActiveFactorProvidersParser.m"), 637, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("promotedPath"));

      }
      v33 = objc_msgSend(v31, "fileExistsAtPath:", v32);

      v34 = v32;
      if ((v33 & 1) == 0)
      {
        v40 = v14;
        v25 = v63;
        v15 = v64;
        v45 = v66;
        v42 = v67;
LABEL_46:

        goto LABEL_47;
      }
      objc_msgSend(v32, "triStringByResolvingSymlinksInPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      v25 = v63;
      if (!v35)
      {
        TRILogCategory_ClientFramework();
        v48 = objc_claimAutoreleasedReturnValue();
        v45 = v66;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v78 = v34;
          v79 = 2112;
          v80 = v62;
          v81 = 2112;
          v82 = v66;
          _os_log_error_impl(&dword_19B89C000, v48, OS_LOG_TYPE_ERROR, "Could not resolve symlink at \"%@\" for namespace \"%@\": %@", buf, 0x20u);
        }

        v40 = v14;
        v15 = v64;
        v42 = v67;
        goto LABEL_45;
      }
      objc_msgSend(v35, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackId(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = v38;
      if (!v38)
      {
        TRILogCategory_ClientFramework();
        v49 = objc_claimAutoreleasedReturnValue();
        v15 = v64;
        v45 = v66;
        v42 = v67;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v78 = v36;
          v79 = 2112;
          v80 = v62;
          _os_log_error_impl(&dword_19B89C000, v49, OS_LOG_TYPE_ERROR, "Could not validate factor pack id from \"%@\" for namespace \"%@\", buf, 0x16u);
        }

        v50 = v14;
        goto LABEL_44;
      }
      v15 = v64;
      if (objc_msgSend(v38, "isEqualToString:", v19))
      {
        *a7 = 0;
      }
      else if (objc_msgSend(v63, "hasAttempts") && objc_msgSend(v63, "attempts") >= 5)
      {
        *a7 = 0;
        if (!+[TRIProcessInfo hostingProcessIsTriald](TRIProcessInfo, "hostingProcessIsTriald"))
        {
          v45 = v66;
          if (objc_msgSend(v63, "hasRejected") && (objc_msgSend(v63, "rejected") & 1) != 0)
          {
            v50 = v34;
            v42 = v67;
          }
          else
          {
            v60 = v36;
            v52 = v34;
            +[TRIRolloutDeployment deploymentWithRolloutId:deploymentId:](TRIRolloutDeployment, "deploymentWithRolloutId:deploymentId:", v64, v65);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            TRILogCategory_ClientFramework();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v78 = v19;
              v79 = 2112;
              v80 = v53;
              v81 = 2112;
              v82 = v62;
              _os_log_error_impl(&dword_19B89C000, v54, OS_LOG_TYPE_ERROR, "Rejecting factor pack id \"%@\" from rollout deployment \"%@\" for namespace \"%@\", buf, 0x20u);
            }

            v55 = (void *)objc_opt_new();
            v70 = v66;
            v56 = objc_msgSend(v55, "rejectFactorPackId:forNamespaceName:rolloutDeployment:error:", v19, v62, v53, &v70);
            v57 = v70;

            v42 = v67;
            if ((v56 & 1) == 0)
            {
              TRILogCategory_ClientFramework();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v78 = v19;
                v79 = 2112;
                v80 = v62;
                _os_log_error_impl(&dword_19B89C000, v58, OS_LOG_TYPE_ERROR, "Could not note factor pack id \"%@\" rejected for namespace \"%@\", buf, 0x16u);
              }

            }
            v50 = v52;
            v45 = v57;
            v34 = v52;
            v25 = v63;
            v15 = v64;
            v36 = v60;
          }
          goto LABEL_44;
        }
        v50 = v34;
LABEL_43:
        v45 = v66;
        v42 = v67;
LABEL_44:
        v40 = v50;

LABEL_45:
        goto LABEL_46;
      }
      v50 = v14;
      goto LABEL_43;
    }
    v42 = v67;
    if (v23)
    {
      objc_msgSend(v23, "domain");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v44 = objc_msgSend(v24, "code");

        if (v44 == 260)
        {
LABEL_32:
          v40 = v14;
LABEL_48:

          v13 = v69;
LABEL_49:

          goto LABEL_50;
        }
      }
      else
      {

      }
    }
    TRILogCategory_ClientFramework();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v78 = v67;
      v79 = 2112;
      v80 = v69;
      v81 = 2112;
      v82 = v24;
      _os_log_error_impl(&dword_19B89C000, v47, OS_LOG_TYPE_ERROR, "Error opening provisional file \"%@\" for namespace \"%@\": %@", buf, 0x20u);
    }

    goto LABEL_32;
  }
  TRILogCategory_ClientFramework();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v78 = v14;
    v79 = 2112;
    v80 = v13;
    _os_log_error_impl(&dword_19B89C000, v39, OS_LOG_TYPE_ERROR, "Could not resolved symlink at \"%@\" for namespace \"%@\", buf, 0x16u);
  }

  v40 = v14;
LABEL_50:

  return v40;
}

id __120__TRIActiveFactorProvidersParser__getFactorPackPathForNamespaceName_withCandidatePath_parentId_deploymentId_promotable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = a2;
  +[TRINamespaceResolver promotionDirForNamespaceName:withPaths:](TRINamespaceResolver, "promotionDirForNamespaceName:withPaths:", v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_faultOnceWithMessage:(id)a3
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
  v7[2] = __56__TRIActiveFactorProvidersParser__faultOnceWithMessage___block_invoke;
  v7[3] = &unk_1E3BFFD68;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __56__TRIActiveFactorProvidersParser__faultOnceWithMessage___block_invoke(uint64_t a1, _BYTE *a2)
{
  _BYTE *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a2[32])
  {
    v4 = a2;
    TRILogCategory_ClientFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_19B89C000, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    a2[32] = 1;
  }
}

- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4
{
  *__error() = 0;
  return realpath_DARWIN_EXTSN(a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
