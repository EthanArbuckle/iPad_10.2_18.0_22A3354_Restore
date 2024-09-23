@implementation TRINamespaceResolver

+ (id)preferredPathForFactorDataWithCandidatePaths:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  void *v36;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRINamespaceResolver.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("candidatePaths.count > 0"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECED7DB0 != -1)
    dispatch_once(&qword_1ECED7DB0, block);
  v6 = (id)_MergedGlobals_8;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if ((unint64_t)(objc_msgSend(v5, "count") * v8) > 0x64)
    {
      TRILogCategory_ClientFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_DEFAULT, "Warning: suppressing entitlement-based path resolution due to high complexity.", buf, 2u);
      }
    }
    else
    {
      v37 = v7;
      objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_126_0);
      v9 = objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v38 = v5;
      obj = v5;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v10)
      {
        v11 = v10;
        v40 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v50 != v40)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v14 = (void *)MEMORY[0x1A1AC6B8C]();
            objc_msgSend(v13, "triStringByResolvingSymlinksInPath");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v16 = v9;
            v17 = v9;
            v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v46;
LABEL_14:
              v21 = 0;
              while (1)
              {
                if (*(_QWORD *)v46 != v20)
                  objc_enumerationMutation(v17);
                if (objc_msgSend(v15, "containsString:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v21)))
                  break;
                if (v19 == ++v21)
                {
                  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                  if (v19)
                    goto LABEL_14;
                  goto LABEL_26;
                }
              }
              v22 = objc_retainAutorelease(v13);
              if (!access((const char *)objc_msgSend(v22, "fileSystemRepresentation"), 4))
              {
                v34 = v22;

                objc_autoreleasePoolPop(v14);
                v7 = v37;
                v5 = v38;
                goto LABEL_49;
              }
              if (*__error() == 1)
              {
                TRILogCategory_ClientFramework();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v56 = obj;
                  _os_log_impl(&dword_19B89C000, v23, OS_LOG_TYPE_INFO, "Sandbox/datavault prevents accessing candidate path: %@", buf, 0xCu);
                }

              }
            }
LABEL_26:

            objc_autoreleasePoolPop(v14);
            v9 = v16;
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v11);
      }

      v7 = v37;
      v5 = v38;
    }

  }
  TRILogCategory_ClientFramework();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B89C000, v24, OS_LOG_TYPE_DEFAULT, "Unable to resolve candidate path based on calling process entitlement; falling back on naive access() check.",
      buf,
      2u);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v5;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v31 = (void *)MEMORY[0x1A1AC6B8C]();
        v32 = objc_retainAutorelease(v30);
        if (!access((const char *)objc_msgSend(v32, "fileSystemRepresentation"), 4))
        {
          v34 = v32;
          objc_autoreleasePoolPop(v31);

          goto LABEL_49;
        }
        if (*__error() == 1)
        {
          TRILogCategory_ClientFramework();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v25;
            _os_log_impl(&dword_19B89C000, v33, OS_LOG_TYPE_INFO, "Sandbox/datavault prevents accessing candidate path: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      if (v27)
        continue;
      break;
    }
  }

  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
  v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

  return v34;
}

- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4
{
  return -[TRINamespaceResolver initWithPaths:factorsState:activeFactorProvidersParser:](self, "initWithPaths:factorsState:activeFactorProvidersParser:", a3, a4, 0);
}

- (BOOL)_prepareFactorsState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSSet *v13;
  NSSet *namespacesInFactorsState;
  TRIRolloutDeployment *v15;
  NSObject *p_super;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSSet *v20;
  NSSet *v21;
  TRIBMLTDeployment *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "deployment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIActiveFactorProvidersParser resolveTargetedFactorPackSetForRolloutDeployment:](self->_activeFactorProvidersParser, "resolveTargetedFactorPackSetForRolloutDeployment:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        LOBYTE(a2) = 0;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("factorPacks"));
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend((id)a2, "contentsOfDirectoryAtPath:error:", v10, &v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;

      LOBYTE(a2) = v11 != 0;
      if (v11)
      {
        v13 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
        namespacesInFactorsState = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v13;

        v15 = v6;
        p_super = &self->_rolloutDeploymentForFactorsState->super;
        self->_rolloutDeploymentForFactorsState = v15;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      TRILogCategory_ClientFramework();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v30 = v12;
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "deployment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TRINamespaceResolver _prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:](self, "_prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:", v6);
      LODWORD(a2) = v17 | -[TRINamespaceResolver _prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:](self, "_prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:", v6);
LABEL_25:

      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "deployment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRINamespaceResolver _resolveTargetedFactorPackSetForBMLTDeployment:](self, "_resolveTargetedFactorPackSetForBMLTDeployment:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v18;
      if (!v18)
      {
        TRILogCategory_ClientFramework();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v6;
          _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "Failed to resolve targeted namespace descriptor for deployment: %@", buf, 0xCu);
        }
        LOBYTE(a2) = 0;
        goto LABEL_23;
      }
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingPathComponent:", CFSTR("factorPacks"));
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend((id)a2, "contentsOfDirectoryAtPath:error:", v10, &v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v27;

      LOBYTE(a2) = v11 != 0;
      if (v11)
      {
        v20 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
        v21 = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v20;

        v22 = v6;
        p_super = &self->_bmltDeploymentForFactorsState->super;
        self->_bmltDeploymentForFactorsState = v22;
        goto LABEL_22;
      }
      TRILogCategory_ClientFramework();
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v30 = v12;
LABEL_17:
      _os_log_error_impl(&dword_19B89C000, p_super, OS_LOG_TYPE_ERROR, "Failed to enumerate namespace names: %@", buf, 0xCu);
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 178, CFSTR("Unrecognized TRIFactorsState subclass: %@"), v25);

    LOBYTE(a2) = 0;
  }
  else
  {
    LOBYTE(a2) = 1;
  }
LABEL_26:

  return (char)a2;
}

- (id)resolveFactorProviderChainForNamespaceName:(id)a3 faultOnMissingInstalledFactors:(BOOL)a4 installedFactorsAccessible:(BOOL *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  TRITypedFactorProvider *v12;
  void *v13;
  TRITypedFactorProvider *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  TRIActiveFactorProvidersParser *activeFactorProvidersParser;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  TRITypedFactorProvider *v24;
  id v25;
  uint64_t v26;
  void *v27;
  int v28;
  TRIActiveFactorProvidersParser *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  TRITypedFactorProvider *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  TRITypedFactorProvider *v38;
  void *v39;
  TRITypedFactorProvider *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  TRITypedFactorProvider *v47;
  TRITypedFactorProvider *v48;
  void *v49;
  TRITypedFactorProvider *v50;
  void *v51;
  TRITypedFactorProvider *v52;
  TRITypedFactorProvider *v53;
  void *v54;
  TRITypedFactorProvider *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;

  v6 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  +[TRINamespaceFactorProvider factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v9, self->_paths, 1, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [TRITypedFactorProvider alloc];
    -[TRIPaths namespaceDescriptorsDefaultDir](self->_paths, "namespaceDescriptorsDefaultDir");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v12, "initWithType:provider:logDesc:", 1, v11, v13);
    objc_msgSend(v10, "addObject:", v14);

  }
  if (a5)
    *a5 = v11 != 0;

  if (-[TRINamespaceResolver _hasBMLTFactorsState](self, "_hasBMLTFactorsState"))
  {
    -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", v9);

    if (v16)
    {
      -[TRINamespaceResolver bmltDeploymentForFactorsState](self, "bmltDeploymentForFactorsState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 436, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("self.bmltDeploymentForFactorsState"));

      }
      -[TRINamespaceResolver _resolveTargetedFactorPackSetForBMLTDeployment:](self, "_resolveTargetedFactorPackSetForBMLTDeployment:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 438, CFSTR("lockedSet for factors state unexpectedly not present"));

      }
      v63 = 0;
      activeFactorProvidersParser = self->_activeFactorProvidersParser;
      objc_msgSend(v17, "backgroundMLTaskId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "deploymentId");
      objc_msgSend(v18, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIActiveFactorProvidersParser factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:](activeFactorProvidersParser, "factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:", v9, v20, v21, 0, v22, &v63);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_22;
      v24 = [TRITypedFactorProvider alloc];
      v25 = v63;
      v26 = 16;
LABEL_21:
      v33 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v24, "initWithType:provider:logDesc:", v26, v23, v25);
      objc_msgSend(v10, "insertObject:atIndex:", v33, 0);

LABEL_22:
      v34 = v10;

      goto LABEL_44;
    }
  }
  if (-[TRINamespaceResolver _hasRolloutFactorsState](self, "_hasRolloutFactorsState"))
  {
    -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", v9);

    if (v28)
    {
      -[TRINamespaceResolver rolloutDeploymentForFactorsState](self, "rolloutDeploymentForFactorsState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 460, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("self.rolloutDeploymentForFactorsState"));

      }
      -[TRIActiveFactorProvidersParser resolveTargetedFactorPackSetForRolloutDeployment:](self->_activeFactorProvidersParser, "resolveTargetedFactorPackSetForRolloutDeployment:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 462, CFSTR("lockedSet for factors state unexpectedly not present"));

      }
      v63 = 0;
      v29 = self->_activeFactorProvidersParser;
      objc_msgSend(v17, "rolloutId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v17, "deploymentId");
      objc_msgSend(v18, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIActiveFactorProvidersParser factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:](v29, "factorProviderForNamespaceName:parentId:deploymentId:treatmentId:fromFactorPackSetWithDir:resolvedPath:", v9, v30, v31, 0, v32, &v63);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_22;
      v24 = [TRITypedFactorProvider alloc];
      v25 = v63;
      v26 = 2;
      goto LABEL_21;
    }
  }
  -[TRIActiveFactorProvidersParser resolvePropertyListFactorProviderChainForNamespaceName:](self->_activeFactorProvidersParser, "resolvePropertyListFactorProviderChainForNamespaceName:", v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  objc_msgSend(v36, "addObjectsFromArray:", v10);
  +[TRINamespaceFactorProvider factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v9, self->_paths, 2, 1, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = [TRITypedFactorProvider alloc];
    -[TRIPaths namespaceDescriptorsRolloutDir](self->_paths, "namespaceDescriptorsRolloutDir");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v38, "initWithType:provider:logDesc:", 2, v37, v39);

    objc_msgSend(v36, "insertObject:atIndex:", v40, 0);
  }

  if (-[TRINamespaceResolver _hasExperimentFactorsState](self, "_hasExperimentFactorsState"))
  {
    -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "containsObject:", v9);

    if (v42)
    {
      -[TRINamespaceResolver experimentDeploymentForFactorsState](self, "experimentDeploymentForFactorsState");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 516, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("self.experimentDeploymentForFactorsState"));

      }
      -[TRINamespaceResolver _resolveTargetedNamespaceDescriptorSetForExperimentDeployment:](self, "_resolveTargetedNamespaceDescriptorSetForExperimentDeployment:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceResolver.m"), 518, CFSTR("lockedSet for namespace descriptor set unexpectedly not present"));

      }
      v63 = 0;
      objc_msgSend(v44, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRINamespaceResolver _factorProviderForNamespaceName:fromNamespaceDescriptorSetWithDir:resolvedPath:](self, "_factorProviderForNamespaceName:fromNamespaceDescriptorSetWithDir:resolvedPath:", v9, v45, &v63);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v47 = [TRITypedFactorProvider alloc];
        v48 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v47, "initWithType:provider:logDesc:", 4, v46, v63);
        objc_msgSend(v36, "insertObject:atIndex:", v48, 0);

      }
    }
  }
  if (!-[TRINamespaceResolver _hasRolloutFactorsState](self, "_hasRolloutFactorsState")
    && !-[TRINamespaceResolver _hasExperimentFactorsState](self, "_hasExperimentFactorsState"))
  {
    +[TRINamespaceFactorProvider factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v9, self->_paths, 4, 1, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = [TRITypedFactorProvider alloc];
      -[TRIPaths namespaceDescriptorsExperimentDir](self->_paths, "namespaceDescriptorsExperimentDir");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v50, "initWithType:provider:logDesc:", 4, v49, v51);

      objc_msgSend(v36, "insertObject:atIndex:", v52, 0);
    }
    if (_os_feature_enabled_impl())
      objc_msgSend(v36, "triMoveFirstItemToFrontPassingTest:", &__block_literal_global_9);

  }
  +[TRINamespaceFactorProvider factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v9, self->_paths, 8, 1, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v53 = [TRITypedFactorProvider alloc];
    -[TRIPaths namespaceDescriptorsExperimentDir](self->_paths, "namespaceDescriptorsExperimentDir");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[TRITypedFactorProvider initWithType:provider:logDesc:](v53, "initWithType:provider:logDesc:", 8, v17, v54);

    objc_msgSend(v36, "insertObject:atIndex:", v55, 0);
  }
  v34 = v36;
LABEL_44:

  return v34;
}

- (BOOL)_hasRolloutFactorsState
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TRINamespaceResolver rolloutDeploymentForFactorsState](self, "rolloutDeploymentForFactorsState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasExperimentFactorsState
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TRINamespaceResolver experimentDeploymentForFactorsState](self, "experimentDeploymentForFactorsState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)namespacesInFactorsState
{
  return self->_namespacesInFactorsState;
}

- (BOOL)_hasBMLTFactorsState
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TRINamespaceResolver namespacesInFactorsState](self, "namespacesInFactorsState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TRINamespaceResolver bmltDeploymentForFactorsState](self, "bmltDeploymentForFactorsState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __31__TRINamespaceResolver_dispose__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_115);
}

- (void)dealloc
{
  objc_super v3;

  -[TRINamespaceResolver dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)TRINamespaceResolver;
  -[TRINamespaceResolver dealloc](&v3, sel_dealloc);
}

- (void)dispose
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_113);
  -[TRIActiveFactorProvidersParser dispose](self->_activeFactorProvidersParser, "dispose");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFactorProvidersParser, 0);
  objc_storeStrong((id *)&self->_bmltDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_experimentDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_rolloutDeploymentForFactorsState, 0);
  objc_storeStrong((id *)&self->_namespacesInFactorsState, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

id __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithFormat:", CFSTR("/Treatments/%@/"), v3);

  return v4;
}

void __69__TRINamespaceResolver_preferredPathForFactorDataWithCandidatePaths___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(*(id *)(a1 + 32), "_namespacePathComponentsFromEntitlements");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = v3;

  objc_autoreleasePoolPop(v2);
}

+ (id)promotionDirForNamespaceName:(id)a3 withPaths:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "namespaceDescriptorsDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), CFSTR("v2/promotion"), v5);

  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_namespacePathComponentsFromEntitlements
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[TRIEntitlement objectForCurrentProcessEntitlement:](TRIEntitlement, "objectForCurrentProcessEntitlement:", CFSTR("com.apple.trial.client"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "processName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("com.apple.trial.client");
      v23 = 2112;
      v24 = v14;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "Process \"%@\" has incorrectly-typed entitlement \"%@\" (expected array of string, decoded %@)", buf, 0x20u);

    }
    goto LABEL_16;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_13;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = v3;
LABEL_17:

  return v8;
}

- (TRINamespaceResolver)initWithPaths:(id)a3
{
  TRINamespaceResolver *v4;
  void *v6;

  v4 = -[TRINamespaceResolver initWithPaths:factorsState:](self, "initWithPaths:factorsState:", a3, 0);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("TRINamespaceResolver.m"), 73, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[self initWithPaths:paths factorsState:nil]"));

  }
  return v4;
}

- (TRINamespaceResolver)initWithPaths:(id)a3 activeFactorProvidersParser:(id)a4
{
  TRINamespaceResolver *v5;
  void *v7;

  v5 = -[TRINamespaceResolver initWithPaths:factorsState:activeFactorProvidersParser:](self, "initWithPaths:factorsState:activeFactorProvidersParser:", a3, 0, a4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("TRINamespaceResolver.m"), 78, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[self initWithPaths:paths factorsState:nil activeFactorProvidersParser:activeFactorProvidersParser]"));

  }
  return v5;
}

- (TRINamespaceResolver)initWithPaths:(id)a3 factorsState:(id)a4 activeFactorProvidersParser:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRINamespaceResolver *v12;
  TRINamespaceResolver *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _PASLock *lock;
  TRIActiveFactorProvidersParser *v21;
  TRIActiveFactorProvidersParser *activeFactorProvidersParser;
  TRINamespaceResolver *v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)TRINamespaceResolver;
  v12 = -[TRINamespaceResolver init](&v26, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_6;
  objc_storeStrong((id *)&v12->_paths, a3);
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v15;

  *(_BYTE *)(v14 + 24) = 0;
  v17 = objc_alloc(MEMORY[0x1E0D815F0]);
  v18 = (void *)objc_opt_new();
  v19 = objc_msgSend(v17, "initWithGuardedData:", v18);

  lock = v13->_lock;
  v13->_lock = (_PASLock *)v19;

  v21 = v11
      ? (TRIActiveFactorProvidersParser *)v11
      : -[TRIActiveFactorProvidersParser initWithPaths:]([TRIActiveFactorProvidersParser alloc], "initWithPaths:", v9);
  activeFactorProvidersParser = v13->_activeFactorProvidersParser;
  v13->_activeFactorProvidersParser = v21;

  if (!-[TRINamespaceResolver _prepareFactorsState:](v13, "_prepareFactorsState:", v10))
  {
    TRILogCategory_ClientFramework();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      _os_log_error_impl(&dword_19B89C000, v24, OS_LOG_TYPE_ERROR, "Failed to prepare factorsState: %{public}@", buf, 0xCu);
    }

    v23 = 0;
  }
  else
  {
LABEL_6:
    v23 = v13;
  }

  return v23;
}

- (BOOL)_prepareFactorsStateForExperimentsOnTreatmentPathForDeployment:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSSet *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSSet *namespacesInFactorsState;
  NSObject *v26;
  TRINamespaceResolver *v28;
  id v29;
  id obj;
  void *v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TRINamespaceResolver _resolveTargetedNamespaceDescriptorSetForExperimentDeployment:](self, "_resolveTargetedNamespaceDescriptorSetForExperimentDeployment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("legacyNamespaceDescriptors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v9, &v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v38;

    v13 = v11 != 0;
    if (v11)
    {
      v28 = self;
      v29 = v12;
      obj = a3;
      v31 = v9;
      v32 = v7;
      v33 = v5;
      v14 = (NSSet *)objc_opt_new();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("."), v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count") == 3
              && (objc_msgSend(v21, "objectAtIndexedSubscript:", 1),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v22, "length"),
                  v22,
                  v23))
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
              v24 = objc_claimAutoreleasedReturnValue();
              -[NSSet addObject:](v14, "addObject:", v24);
            }
            else
            {
              TRILogCategory_ClientFramework();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v20;
                _os_log_fault_impl(&dword_19B89C000, v24, OS_LOG_TYPE_FAULT, "Unexpected namespace descriptor filename: %@", buf, 0xCu);
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v17);
      }

      namespacesInFactorsState = v28->_namespacesInFactorsState;
      v28->_namespacesInFactorsState = v14;
      v26 = v14;

      objc_storeStrong((id *)&v28->_experimentDeploymentForFactorsState, obj);
      v7 = v32;
      v5 = v33;
      v9 = v31;
      v13 = v11 != 0;
      v12 = v29;
    }
    else
    {
      TRILogCategory_ClientFramework();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v12;
        _os_log_fault_impl(&dword_19B89C000, v26, OS_LOG_TYPE_FAULT, "Failed to enumerate namespace descriptor filenames: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_prepareFactorsStateForExperimentsOnFactorPackSetPathForDeployment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSSet *v13;
  NSSet *namespacesInFactorsState;
  TRIExperimentDeployment *v15;
  NSObject *p_super;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[TRIActiveFactorProvidersParser resolveTargetedFactorPackSetForExperimentDeployment:](self->_activeFactorProvidersParser, "resolveTargetedFactorPackSetForExperimentDeployment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("factorPacks"));
      v8 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v8, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;

      v12 = v10 != 0;
      if (v10)
      {
        v13 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
        namespacesInFactorsState = self->_namespacesInFactorsState;
        self->_namespacesInFactorsState = v13;

        v15 = (TRIExperimentDeployment *)v4;
        p_super = &self->_experimentDeploymentForFactorsState->super;
        self->_experimentDeploymentForFactorsState = v15;
      }
      else
      {
        TRILogCategory_ClientFramework();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v11;
          _os_log_fault_impl(&dword_19B89C000, p_super, OS_LOG_TYPE_FAULT, "Failed to enumerate namespace names: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_19B89C000, v8, OS_LOG_TYPE_INFO, "Failed to resolve targeted experiment factor pack set for deployment: %@. This is expected for old experiments downloaded before FPE was enabled.", buf, 0xCu);
      }
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  v7[2] = __46__TRINamespaceResolver__faultOnceWithMessage___block_invoke;
  v7[3] = &unk_1E3BFF418;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __46__TRINamespaceResolver__faultOnceWithMessage___block_invoke(uint64_t a1, _BYTE *a2)
{
  _BYTE *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a2[24])
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

    a2[24] = 1;
  }
}

- (char)_realpathWithFileSystemRepresentation:(const char *)a3 buffer:(char *)a4
{
  *__error() = 0;
  return realpath_DARWIN_EXTSN(a3, a4);
}

- (id)_resolveTargetedFactorPackSetForBMLTDeployment:(id)a3
{
  id v5;
  _PASLock *lock;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  TRINamespaceResolver *v12;
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
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__TRINamespaceResolver__resolveTargetedFactorPackSetForBMLTDeployment___block_invoke;
  v10[3] = &unk_1E3BFF440;
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

void __71__TRINamespaceResolver__resolveTargetedFactorPackSetForBMLTDeployment___block_invoke(uint64_t a1, void *a2)
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
  id v12;
  char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  TRIReferenceManagedDirReaderLock *v17;
  TRIReferenceManagedDirReaderLock *v18;
  TRILockedFactorPackSet *v19;
  uint64_t v20;
  void *v21;
  int *v22;
  char *v23;
  int v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  char v32[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(*(id *)(a1 + 32), "backgroundMLTaskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("v2/bmlt/%@/%d/%@"), v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), CFSTR("targetedFactorPackSet"));
    objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    bzero(v32, 0x400uLL);
    *__error() = 0;
    v12 = objc_retainAutorelease(v11);
    v13 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v12, "fileSystemRepresentation"), v32);
    if (v13)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRINamespaceResolver.m"), 306, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[NSString alloc] initWithUTF8String:rp]"));

      }
      -[NSObject lastPathComponent](v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateFactorPackSetId(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = -[TRIReferenceManagedDirReaderLock initWithDir:]([TRIReferenceManagedDirReaderLock alloc], "initWithDir:", v14);
        if (v17)
        {
          v18 = v17;
          v19 = -[TRILockedFactorPackSet initWithFactorPackSetId:path:lock:]([TRILockedFactorPackSet alloc], "initWithFactorPackSetId:path:lock:", v16, v14, v17);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

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
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = __error();
        v23 = strerror(*v22);
        v24 = *__error();
        *(_DWORD *)buf = 138412802;
        v27 = v12;
        v28 = 2080;
        v29 = v23;
        v30 = 1024;
        v31 = v24;
        _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve BMLT deployment %@: %s (%d)", buf, 0x1Cu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (id)_resolveTargetedNamespaceDescriptorSetForExperimentDeployment:(id)a3
{
  id v5;
  _PASLock *lock;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  TRINamespaceResolver *v12;
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
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__TRINamespaceResolver__resolveTargetedNamespaceDescriptorSetForExperimentDeployment___block_invoke;
  v10[3] = &unk_1E3BFF440;
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

void __86__TRINamespaceResolver__resolveTargetedNamespaceDescriptorSetForExperimentDeployment___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v3[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
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
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("v2/experiment/%@/%d/%@"), v9, objc_msgSend(*(id *)(a1 + 32), "deploymentId"), CFSTR("targetedNamespaceDescriptorSet"));
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
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRINamespaceResolver.m"), 345, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[NSString alloc] initWithUTF8String:expandedPath]"));

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

          objc_msgSend(v3[1], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32));
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

- (id)_factorProviderForNamespaceName:(id)a3 fromNamespaceDescriptorSetWithDir:(id)a4 resolvedPath:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a4, "stringByAppendingPathComponent:", CFSTR("legacyNamespaceDescriptors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triStringByResolvingSymlinksInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_ClientFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_debug_impl(&dword_19B89C000, v11, OS_LOG_TYPE_DEBUG, "Opening treatment via id-based namespace descriptor path: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_storeStrong(a5, v9);
  +[TRINamespaceDescriptor loadWithNamespaceName:fromDirectory:](TRINamespaceDescriptor, "loadWithNamespaceName:fromDirectory:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[TRINamespaceFactorProvider factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:](TRINamespaceFactorProvider, "factorProviderWithNamespaceDescriptor:paths:faultOnMissingFactors:shouldLockFactorDirectory:", v12, self->_paths, 1, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TRILogCategory_ClientFramework();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "Failed to load namespace descriptor from parent dir: %@", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

BOOL __125__TRINamespaceResolver_resolveFactorProviderChainForNamespaceName_faultOnMissingInstalledFactors_installedFactorsAccessible___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 32;
}

void __31__TRINamespaceResolver_dispose__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "lock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

}

- (TRIRolloutDeployment)rolloutDeploymentForFactorsState
{
  return self->_rolloutDeploymentForFactorsState;
}

- (TRIExperimentDeployment)experimentDeploymentForFactorsState
{
  return self->_experimentDeploymentForFactorsState;
}

- (TRIBMLTDeployment)bmltDeploymentForFactorsState
{
  return self->_bmltDeploymentForFactorsState;
}

- (TRIActiveFactorProvidersParser)activeFactorProvidersParser
{
  return self->_activeFactorProvidersParser;
}

@end
