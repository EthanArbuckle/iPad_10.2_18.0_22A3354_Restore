@implementation TRIDefaultFactorProvider

- (void)invalidateAllFactorProviders
{
  TRINamespaceResolver *v3;
  NSObject *v4;
  NSObject *p_super;
  _PASLock *lock;
  TRIFactorsState *factorsState;
  _QWORD v8[4];
  TRINamespaceResolver *v9;
  uint8_t buf[4];
  TRIFactorsState *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[TRINamespaceResolver initWithPaths:factorsState:]([TRINamespaceResolver alloc], "initWithPaths:factorsState:", self->_paths, self->_factorsState);
  TRILogCategory_ClientFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  p_super = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19B89C000, p_super, OS_LOG_TYPE_DEBUG, "Clearing memory cache and file locks.", buf, 2u);
    }

    lock = self->_lock;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke;
    v8[3] = &unk_1E3BFF0B8;
    v9 = v3;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
    p_super = &v9->super;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    factorsState = self->_factorsState;
    *(_DWORD *)buf = 138412290;
    v11 = factorsState;
    _os_log_impl(&dword_19B89C000, p_super, OS_LOG_TYPE_DEFAULT, "Not invalidating namespace because factorsState is stale: %@", buf, 0xCu);
  }

}

- (TRIDefaultFactorProvider)initWithPaths:(id)a3 factorsState:(id)a4
{
  id v7;
  id v8;
  TRIDefaultFactorProvider *v9;
  TRIDefaultFactorProvider *v10;
  TRINamespaceResolver *v11;
  _QWORD *v12;
  void *v13;
  TRINamespaceResolver *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _PASLock *lock;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TRIDefaultFactorProvider;
  v9 = -[TRIDefaultFactorProvider init](&v22, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_storeStrong((id *)&v9->_paths, a3);
  objc_storeStrong((id *)&v10->_factorsState, a4);
  v11 = -[TRINamespaceResolver initWithPaths:factorsState:]([TRINamespaceResolver alloc], "initWithPaths:factorsState:", v7, v10->_factorsState);
  if (v11)
  {
    v12 = (_QWORD *)objc_opt_new();
    v13 = (void *)v12[1];
    v12[1] = v11;
    v14 = v11;

    v15 = objc_opt_new();
    v16 = (void *)v12[2];
    v12[2] = v15;

    v17 = objc_opt_new();
    v18 = (void *)v12[3];
    v12[3] = v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v12);
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v19;

LABEL_4:
    v11 = v10;
  }

  return (TRIDefaultFactorProvider *)v11;
}

void __50__TRIDefaultFactorProvider__providerForNamespace___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  TRINamespaceResolver *v8;
  void *v9;
  TRINamespaceFactorProviderChain *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id *v14;

  v14 = a2;
  objc_msgSend(v14[2], "objectForKeyedSubscript:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v14[3], "objectForKeyedSubscript:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1[5] + 8), "pathsForContainer:asClientProcess:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("TRIDefaultFactorProvider.m"), 119, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[_paths pathsForContainer:container asClientProcess:YES]"));

      }
      v8 = -[TRINamespaceResolver initWithPaths:]([TRINamespaceResolver alloc], "initWithPaths:", v7);
      -[TRINamespaceResolver resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:](v8, "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", a1[4], 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRINamespaceResolver dispose](v8, "dispose");

    }
    else
    {
      objc_msgSend(v14[1], "resolveFactorProviderChainForNamespaceName:faultOnMissingInstalledFactors:installedFactorsAccessible:", a1[4], 1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = -[TRINamespaceFactorProviderChain initWithNamespaceName:typedProviderChain:paths:]([TRINamespaceFactorProviderChain alloc], "initWithNamespaceName:typedProviderChain:paths:", a1[4], v9, *(_QWORD *)(a1[5] + 8));
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(v14[2], "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
  }

}

uint64_t __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "dispose");
}

- (id)experimentDeploymentWithNamespaceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (-[TRIDefaultFactorProvider _experimentDeploymentWithNamespaceName:treatmentLayer:](self, "_experimentDeploymentWithNamespaceName:treatmentLayer:", v4, 32), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[TRIDefaultFactorProvider _experimentDeploymentWithNamespaceName:treatmentLayer:](self, "_experimentDeploymentWithNamespaceName:treatmentLayer:", v4, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)treatmentIdWithNamespaceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!_os_feature_enabled_impl()
    || (-[TRIDefaultFactorProvider _treatmentIdWithNamespaceName:treatmentLayer:](self, "_treatmentIdWithNamespaceName:treatmentLayer:", v4, 32), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[TRIDefaultFactorProvider _treatmentIdWithNamespaceName:treatmentLayer:](self, "_treatmentIdWithNamespaceName:treatmentLayer:", v4, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)factorPackIdForRolloutWithNamespaceName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerForTreatmentLayer:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rolloutDeploymentWithNamespaceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TRIRolloutDeployment *v8;
  void *v9;
  void *v10;
  void *v11;
  TRIRolloutDeployment *v12;
  void *v13;

  v4 = a3;
  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerForTreatmentLayer:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:]([TRIRolloutDeployment alloc], "initWithRolloutId:deploymentId:", v7, objc_msgSend(v6, "deploymentId"));
  }
  else
  {
    objc_msgSend(v6, "treatmentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[TRITreatmentInfo loadInfoForTreatment:namespaceName:paths:](TRITreatmentInfo, "loadInfoForTreatment:namespaceName:paths:", v9, v4, self->_paths);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "experimentId");
        v8 = (TRIRolloutDeployment *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v12 = [TRIRolloutDeployment alloc];
          objc_msgSend(v11, "experimentId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[TRIRolloutDeployment initWithRolloutId:deploymentId:](v12, "initWithRolloutId:deploymentId:", v13, objc_msgSend(v11, "deploymentId"));

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)_providerForNamespace:(id)a3
{
  id v5;
  _PASLock *lock;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  TRIDefaultFactorProvider *v12;
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
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__TRIDefaultFactorProvider__providerForNamespace___block_invoke;
  v10[3] = &unk_1E3BFF108;
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

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "levelForFactor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __56__TRIDefaultFactorProvider_invalidateAllFactorProviders__block_invoke(uint64_t a1, id *a2)
{
  id v4;
  id *v5;

  v4 = a2[2];
  v5 = a2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
  objc_msgSend(a2[2], "removeAllObjects");
  objc_msgSend(v5[1], "dispose");
  objc_storeStrong(v5 + 1, *(id *)(a1 + 32));

}

- (id)factorLevelsWithNamespaceName:(id)a3
{
  void *v3;
  void *v4;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "factorLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)setContainer:(id)a3 forNamespaceName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _PASLock *lock;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  TRIDefaultFactorProvider *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TRILogCategory_ClientFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19B89C000, v8, OS_LOG_TYPE_DEFAULT, "Setting container %@ for namespace %@", buf, 0x16u);
  }

  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__TRIDefaultFactorProvider_setContainer_forNamespaceName___block_invoke;
  v12[3] = &unk_1E3BFF0E0;
  v13 = v6;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);

}

uint64_t __58__TRIDefaultFactorProvider_setContainer_forNamespaceName___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(void **)(a2 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
    return objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v5);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, v5);
  return objc_msgSend(*(id *)(a1 + 48), "invalidateAllFactorProviders");
}

- (BOOL)hasRegisteredNamespaceWithName:(id)a3
{
  void *v3;
  char v4;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isRegistered");
  else
    v4 = 0;

  return v4;
}

- (unsigned)compatibilityVersionWithNamespaceName:(id)a3
{
  void *v3;
  unsigned int v4;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "namespaceCompatibilityVersion");
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasTreatmentInAnyOfLayers:(unint64_t)a3 withNamespaceName:(id)a4
{
  void *v5;
  char v6;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "hasAnyTreatmentInLayers:", a3);
  else
    v6 = 0;

  return v6;
}

- (void)cacheFactorLevelsWithNamespaceName:(id)a3
{
  id v3;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheFactorLevels");

}

- (id)_experimentDeploymentWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TRIExperimentDeployment *v9;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerForTreatmentLayer:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "deploymentId");
    if (v7)
      v9 = -[TRIExperimentDeployment initWithExperimentId:deploymentId:]([TRIExperimentDeployment alloc], "initWithExperimentId:deploymentId:", v7, v8);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_treatmentIdWithNamespaceName:(id)a3 treatmentLayer:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerForTreatmentLayer:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bmltDeploymentWithNamespaceName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  TRIBMLTDeployment *v6;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerForTreatmentLayer:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[TRIBMLTDeployment initWithBackgroundMLTaskId:deploymentId:]([TRIBMLTDeployment alloc], "initWithBackgroundMLTaskId:deploymentId:", v5, objc_msgSend(v4, "deploymentId"));
  else
    v6 = 0;

  return v6;
}

- (id)factorPackIdForBmltWithNamespaceName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerForTreatmentLayer:", 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "treatmentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)promotableFactorPackIdForNamespaceName:(id)a3
{
  void *v3;
  void *v4;

  -[TRIDefaultFactorProvider _providerForNamespace:](self, "_providerForNamespace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "promotableFactorPackId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x1E0DC0F18];
  v7 = a3;
  objc_msgSend(v6, "namespaceNameFromId:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDefaultFactorProvider levelForFactor:withNamespaceName:](self, "levelForFactor:withNamespaceName:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)factorLevelsWithNamespace:(unsigned int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC0F18], "namespaceNameFromId:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDefaultFactorProvider factorLevelsWithNamespaceName:](self, "factorLevelsWithNamespaceName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
