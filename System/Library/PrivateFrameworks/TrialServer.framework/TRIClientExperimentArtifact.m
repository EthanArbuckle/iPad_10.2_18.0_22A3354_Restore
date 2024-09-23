@implementation TRIClientExperimentArtifact

- (id)factorPackSetIdForTreatmentId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TRIClientExperimentArtifact experiment](self, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "factorPackSetMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasDeploymentId
{
  return -[TRIClientExperimentArtifact deploymentId](self, "deploymentId") >= 0;
}

- (TRIExperimentDeployment)experimentDeployment
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  -[TRIClientExperimentArtifact experimentId](self, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[TRIClientExperimentArtifact hasDeploymentId](self, "hasDeploymentId"))
      v4 = -[TRIClientExperimentArtifact deploymentId](self, "deploymentId");
    else
      v4 = 0xFFFFFFFFLL;
    v6 = objc_alloc(MEMORY[0x1E0DC0A30]);
    -[TRIClientExperimentArtifact experimentId](self, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithExperimentId:deploymentId:", v7, v4);

  }
  else
  {
    v5 = 0;
  }
  return (TRIExperimentDeployment *)v5;
}

+ (TRIClientExperimentArtifact)artifactWithExperiment:(id)a3
{
  id v3;
  TRIClientExperimentArtifact *v4;

  v3 = a3;
  v4 = -[TRIClientExperimentArtifact initWithExperiment:]([TRIClientExperimentArtifact alloc], "initWithExperiment:", v3);

  return v4;
}

- (TRIClientExperimentArtifact)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-init is not a valid initializer for the class TRIClientExperimentArtifact"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (TRIClientExperimentArtifact)initWithExperiment:(id)a3
{
  id v5;
  TRIClientExperimentArtifact *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRIClientExperimentArtifact;
  v6 = -[TRIClientExperimentArtifact init](&v10, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("TRIClientExperimentArtifact.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experiment"));

    }
    objc_msgSend(v5, "experimentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIClientExperimentArtifact setExperimentId:](v6, "setExperimentId:", v7);

    -[TRIClientExperimentArtifact setDeploymentId:](v6, "setDeploymentId:", objc_msgSend(v5, "deploymentId"));
  }

  return v6;
}

- (TRIClientExperiment)experiment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v23;
  NSObject *v24;
  int v25;
  id v26;
  uint8_t buf[4];
  NSObject *v28;
  __int16 v29;
  _WORD v30[9];

  *(_QWORD *)&v30[5] = *MEMORY[0x1E0C80C00];
  -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC0E88];
    -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v4, "parseFromData:error:", v5, &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;

    if (v7 || !v6)
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "failed to decode experiment: %@", buf, 0xCu);
      }

    }
    else
    {
      if ((objc_msgSend(v6, "hasExperimentId") & 1) == 0)
      {
        TRILogCategory_Server();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          -[TRIClientExperimentArtifact experimentId](self, "experimentId");
          v23 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v23;
          _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "experiment definition contains no experiment id.  assume id %@", buf, 0xCu);

        }
        -[TRIClientExperimentArtifact experimentId](self, "experimentId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setExperimentId:", v9);

      }
      -[TRIClientExperimentArtifact experimentId](self, "experimentId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "experimentId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        if (objc_msgSend(v6, "hasDeploymentId"))
          v13 = objc_msgSend(v6, "deploymentId");
        else
          v13 = -1;
        if (-[TRIClientExperimentArtifact deploymentId](self, "deploymentId") == v13)
        {
          if (objc_msgSend(v6, "type") == 3)
          {
            if (objc_msgSend(v6, "hasEndDate"))
            {
              objc_msgSend(v6, "endDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "seconds");

              if (!v21)
                objc_msgSend(v6, "setEndDate:", 0);
            }
          }
          v15 = v6;
          goto LABEL_30;
        }
        TRILogCategory_Server();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[TRIClientExperimentArtifact experimentId](self, "experimentId");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = -[TRIClientExperimentArtifact deploymentId](self, "deploymentId");
          *(_DWORD *)buf = 138412802;
          v28 = v24;
          v29 = 1024;
          *(_DWORD *)v30 = v25;
          v30[2] = 1024;
          *(_DWORD *)&v30[3] = v13;
          _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "deployment id mismatch for experiment %@: %d != %d", buf, 0x18u);

        }
      }
      else
      {
        TRILogCategory_Server();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[TRIClientExperimentArtifact experimentId](self, "experimentId");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "experimentId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v18;
          v29 = 2112;
          *(_QWORD *)v30 = v19;
          _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "experiment id mismatch: %@ != %@", buf, 0x16u);

        }
      }

    }
    v15 = 0;
LABEL_30:

    goto LABEL_31;
  }
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIClientExperimentArtifact experimentId](self, "experimentId");
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v14;
    v29 = 1024;
    *(_DWORD *)v30 = -[TRIClientExperimentArtifact experimentType](self, "experimentType");
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "no experiment definition to decode experimentId: %@ type: %d", buf, 0x12u);

  }
  v15 = 0;
LABEL_31:

  return (TRIClientExperiment *)v15;
}

+ (id)_convertNamespaceIdsToNames:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_3);
}

id __59__TRIClientExperimentArtifact__convertNamespaceIdsToNames___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)MEMORY[0x1E0DC0F18];
      v5 = objc_msgSend(v2, "unsignedIntValue");
      v6 = v4;
    }
    else
    {
      TRILogCategory_Server();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v11 = 138543618;
        *(_QWORD *)&v11[4] = v2;
        *(_WORD *)&v11[12] = 2112;
        *(_QWORD *)&v11[14] = objc_opt_class();
        v10 = *(id *)&v11[14];
        _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "unexpected type for namespace: %{public}@ <%@>", v11, 0x16u);

      }
      v6 = (void *)MEMORY[0x1E0DC0F18];
      v5 = 0;
    }
    objc_msgSend(v6, "namespaceNameFromId:", v5, *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v3;

  return v8;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[TRIClientExperimentArtifact publicCertificate](self, "publicCertificate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[TRIClientExperimentArtifact encodedExperimentDefinitionSignature](self, "encodedExperimentDefinitionSignature");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "validateBase64Signature:data:", v5, v6);

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

- (BOOL)isCompatibleWithNamespaceDescriptorProvider:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void **v26;
  uint64_t *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id *v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[TRIClientExperimentArtifact experimentType](self, "experimentType") != 1
    && -[TRIClientExperimentArtifact experimentType](self, "experimentType") != 3)
  {
LABEL_10:
    LOBYTE(a4) = 1;
    goto LABEL_20;
  }
  -[TRIClientExperimentArtifact namespaces](self, "namespaces");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[TRIClientExperimentArtifact namespaces](self, "namespaces"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v8,
        v10))
  {
    -[TRIClientExperimentArtifact namespaces](self, "namespaces");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 == v14)
    {
      if (!-[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"))
      {
        v35 = (void *)objc_opt_new();
        v36 = (void *)objc_opt_new();
        -[TRIClientExperimentArtifact namespaces](self, "namespaces");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __81__TRIClientExperimentArtifact_isCompatibleWithNamespaceDescriptorProvider_error___block_invoke;
        v42[3] = &unk_1E93306A0;
        v42[4] = self;
        v43 = v6;
        v44 = v35;
        v45 = v36;
        v46 = a4;
        v38 = v36;
        v39 = v35;
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v42);

        LOBYTE(a4) = objc_msgSend(v38, "isEqualToSet:", v39);
        goto LABEL_20;
      }
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[TRIClientExperimentArtifact experimentDeployment](self, "experimentDeployment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDesc");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        TRIDeploymentEnvironment_EnumDescriptor();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "enumNameForValue:", -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v17;
        v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "experiment %@ has deployment environment %@; bypassing namespace descriptor checks.",
          buf,
          0x16u);

      }
      goto LABEL_10;
    }
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[TRIClientExperimentArtifact experimentId](self, "experimentId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v41;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "mismatch in namespaces and namespace compatibility versions in definition of experiment %@", buf, 0xCu);

    }
    if (a4)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[TRIClientExperimentArtifact experimentId](self, "experimentId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("mismatch in namespaces and namespace compatibility versions in definition of experiment %@"), v30);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = v23;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = &v52;
      v27 = &v51;
      goto LABEL_19;
    }
  }
  else
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[TRIClientExperimentArtifact experimentId](self, "experimentId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v40;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "missing namespaces in definition of experiment %@", buf, 0xCu);

    }
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      -[TRIClientExperimentArtifact experimentId](self, "experimentId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("missing namespaces in definition of experiment %@"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = *MEMORY[0x1E0CB2D50];
      v54[0] = v23;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = (void **)v54;
      v27 = &v53;
LABEL_19:
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v31);
      v33 = *a4;
      *a4 = v32;

      LOBYTE(a4) = 0;
    }
  }
LABEL_20:

  return (char)a4;
}

void __81__TRIClientExperimentArtifact_isCompatibleWithNamespaceDescriptorProvider_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void **v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "namespaceCompatibilityVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(*(id *)(a1 + 40), "descriptorWithNamespaceName:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((_DWORD)v8 == objc_msgSend(v9, "downloadNCV"))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
      goto LABEL_13;
    }
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "experimentId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      TRILoggedNamespaceName(v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v34 = v29;
      v35 = 2114;
      v36 = v30;
      v37 = 1024;
      v38 = v8;
      v39 = 1024;
      v40 = objc_msgSend(v10, "downloadNCV");
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "experiment %@ with namespace %{public}@ has compatibility version %u which is incompatible with %u", buf, 0x22u);

    }
    if (*(_QWORD *)(a1 + 64))
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "experimentId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("experiment %@ with namespace %@ has compatibility version %u which is incompatible with %u"), v24, v5, v8, objc_msgSend(v10, "downloadNCV"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = v17;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v32;
      v21 = &v31;
      goto LABEL_12;
    }
  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "experimentDeployment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDesc");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      TRILoggedNamespaceName(v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v13;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Warning: experiment %@ specifies namespace %{public}@, which is not registered with Trial", buf, 0x16u);

    }
    if (*(_QWORD *)(a1 + 64))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "experimentId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("experiment %@ specifies namespace %@, which is not registered with Trial. Please make sure namespace descriptor for %@ is installed."), v16, v5, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = v17;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = (void **)v42;
      v21 = &v41;
LABEL_12:
      objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v25);
      v27 = *(void ***)(a1 + 64);
      v28 = *v27;
      *v27 = (void *)v26;

    }
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);

}

- (BOOL)saveWithDatabase:(id)a3 paths:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TRIClientExperimentArtifact experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "experimentId");
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasDeploymentId"))
    {
      v9 = objc_msgSend(v7, "deploymentId");
      if (v8)
      {
        if ((_DWORD)v9 != -1)
        {
          v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A30]), "initWithExperimentId:deploymentId:", v8, v9);
          if (objc_msgSend(v7, "type") != 3 || !objc_msgSend(v7, "hasShadowEvaluation"))
          {
            v17 = (void *)objc_opt_new();
            -[TRIClientExperimentArtifact namespaces](self, "namespaces");
            v18 = objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = (void *)v18;
              -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions");
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v21 = (void *)v20;
                -[TRIClientExperimentArtifact namespaces](self, "namespaces");
                v33 = v17;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v22, "count");
                -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "count");

                v17 = v33;
                if (v32 == v24)
                {
                  -[TRIClientExperimentArtifact namespaces](self, "namespaces");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v34[0] = MEMORY[0x1E0C809B0];
                  v34[1] = 3221225472;
                  v34[2] = __54__TRIClientExperimentArtifact_saveWithDatabase_paths___block_invoke;
                  v34[3] = &unk_1E93306C8;
                  v34[4] = self;
                  v35 = v33;
                  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v34);

                }
              }
              else
              {

              }
            }
            if (objc_msgSend(v7, "hasStartDate"))
            {
              objc_msgSend(v7, "startDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "date");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v28 = 0;
            }
            if (objc_msgSend(v7, "hasEndDate"))
            {
              objc_msgSend(v7, "endDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "date");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v30 = 0;
            }
            v12 = objc_msgSend(v5, "addExperimentWithExperimentDeployment:environment:type:status:startDate:endDate:namespaces:artifact:", v10, -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"), objc_msgSend(v7, "type"), 0, v28, v30, v17, self) != 0;

            goto LABEL_18;
          }
          TRILogCategory_Server();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            -[NSObject shortDesc](v10, "shortDesc");
            v31 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v37 = v31;
            _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "can't save experiment %@ because shadow_evaluation is unsupported for V1 rollouts", buf, 0xCu);

          }
LABEL_17:
          v12 = 0;
LABEL_18:

          goto LABEL_19;
        }
        goto LABEL_14;
      }
    }
    else if (v8)
    {
LABEL_14:
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      v13 = "can't save experiment id %@ with nil deploymentId";
      v14 = v10;
      v15 = 12;
LABEL_33:
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_17;
    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v13 = "can't save experiment with nil experimentId";
    v14 = v10;
    v15 = 2;
    goto LABEL_33;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[TRIClientExperimentArtifact experimentId](self, "experimentId");
    v26 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v26;
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "no client experiment found on artifact for experiment id %@", buf, 0xCu);

  }
  v12 = 0;
LABEL_19:

  return v12;
}

void __54__TRIClientExperimentArtifact_saveWithDatabase_paths___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "namespaceCompatibilityVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntValue");

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0BB0]), "initWithName:compatibilityVersion:", v6, v9);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

}

- (BOOL)hasNamespacesAvailableForExperimentWithDatabase:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientExperimentArtifact.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

  }
  -[TRIClientExperimentArtifact experiment](self, "experiment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClientExperimentArtifact experimentDeployment](self, "experimentDeployment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7 && (objc_msgSend(v7, "hasDeploymentId") & 1) != 0)
  {
    if (-[TRIClientExperimentArtifact experimentType](self, "experimentType") == 3
      || (objc_msgSend(v6, "hasShadowEvaluation") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      if (objc_msgSend(v6, "hasStartDate"))
      {
        objc_msgSend(v6, "startDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      if (objc_msgSend(v6, "hasEndDate"))
      {
        objc_msgSend(v6, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      -[TRIClientExperimentArtifact namespaces](self, "namespaces");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = v16;
      else
        v18 = MEMORY[0x1E0C9AA60];
      v9 = objc_msgSend(v5, "namespacesAreAvailableForExperiment:startDate:endDate:namespaces:", v8, v13, v15, v18);

    }
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "experiment definition is missing or has no deployment id", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)asPersistedArtifact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[TRIClientExperimentArtifact experimentId](self, "experimentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentId:", v4);

  if ((-[TRIClientExperimentArtifact deploymentId](self, "deploymentId") & 0x80000000) == 0)
    objc_msgSend(v3, "setDeploymentId:", -[TRIClientExperimentArtifact deploymentId](self, "deploymentId"));
  objc_msgSend(v3, "setCloudKitContainer:", -[TRIClientExperimentArtifact cloudKitContainer](self, "cloudKitContainer"));
  -[TRIClientExperimentArtifact teamId](self, "teamId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TRIClientExperimentArtifact teamId](self, "teamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTeamId:", v6);

  }
  -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEncodedExperimentDefinition:", v8);

  }
  -[TRIClientExperimentArtifact encodedExperimentDefinitionSignature](self, "encodedExperimentDefinitionSignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TRIClientExperimentArtifact encodedExperimentDefinitionSignature](self, "encodedExperimentDefinitionSignature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEncodedExperimentDefinitionSignature:", v10);

  }
  -[TRIClientExperimentArtifact publicCertificate](self, "publicCertificate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TRIClientExperimentArtifact publicCertificate](self, "publicCertificate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPublicCertificate:", v12);

  }
  objc_msgSend(v3, "setStatus:", -[TRIClientExperimentArtifact experimentState](self, "experimentState"));
  objc_msgSend(v3, "setType:", -[TRIClientExperimentArtifact experimentType](self, "experimentType"));
  objc_msgSend(v3, "setPriority:", -[TRIClientExperimentArtifact experimentPriority](self, "experimentPriority"));
  objc_msgSend(v3, "setInternalBuildOnly:", -[TRIClientExperimentArtifact internalBuildOnly](self, "internalBuildOnly"));
  -[TRIClientExperimentArtifact deploymentDate](self, "deploymentDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0DC0F50]);
    -[TRIClientExperimentArtifact deploymentDate](self, "deploymentDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDate:", v15);
    objc_msgSend(v3, "setDeploymentDate:", v16);

  }
  -[TRIClientExperimentArtifact namespaces](self, "namespaces");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TRIClientExperimentArtifact namespaces](self, "namespaces");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v3, "setNamespacesArray:", v19);

  }
  -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v25);
          objc_msgSend(v3, "namespaceCompatibilityVersionsArray");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addValue:", objc_msgSend(v26, "unsignedIntValue"));

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v23);
    }

  }
  objc_msgSend(v3, "setDeploymentEnvironment:", -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment"));
  return v3;
}

- (id)data
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIClientExperimentArtifact asPersistedArtifact](self, "asPersistedArtifact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientExperimentArtifact.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

  }
  objc_autoreleasePoolPop(v4);
  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v33 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPersistedExperimentArtifact, "parseFromData:error:", v5, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  v9 = v8;
  if (v7)
  {
    if ((objc_msgSend(v7, "hasExperimentId") & 1) != 0)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC0A30]);
      objc_msgSend(v7, "experimentId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasDeploymentId"))
        v12 = objc_msgSend(v7, "deploymentId");
      else
        v12 = 0xFFFFFFFFLL;
      v15 = (void *)objc_msgSend(v10, "initWithExperimentId:deploymentId:", v11, v12);

      +[TRIClientExperimentArtifact artifactWithExperiment:](TRIClientExperimentArtifact, "artifactWithExperiment:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCloudKitContainer:", objc_msgSend(v7, "cloudKitContainer"));
      if ((objc_msgSend(v7, "hasTeamId") & 1) != 0)
      {
        objc_msgSend(v7, "teamId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTeamId:", v19);

      }
      else
      {
        objc_msgSend(v14, "setTeamId:", 0);
      }
      if ((objc_msgSend(v7, "hasEncodedExperimentDefinition") & 1) != 0)
      {
        objc_msgSend(v7, "encodedExperimentDefinition");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setEncodedExperimentDefinition:", v20);

      }
      else
      {
        objc_msgSend(v14, "setEncodedExperimentDefinition:", 0);
      }
      if ((objc_msgSend(v7, "hasEncodedExperimentDefinitionSignature") & 1) != 0)
      {
        objc_msgSend(v7, "encodedExperimentDefinitionSignature");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setEncodedExperimentDefinitionSignature:", v21);

      }
      else
      {
        objc_msgSend(v14, "setEncodedExperimentDefinitionSignature:", 0);
      }
      if ((objc_msgSend(v7, "hasPublicCertificate") & 1) != 0)
      {
        objc_msgSend(v7, "publicCertificate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPublicCertificate:", v22);

      }
      else
      {
        objc_msgSend(v14, "setPublicCertificate:", 0);
      }
      objc_msgSend(v14, "setExperimentState:", objc_msgSend(v7, "status"));
      objc_msgSend(v14, "setExperimentType:", objc_msgSend(v7, "type"));
      objc_msgSend(v14, "setExperimentPriority:", objc_msgSend(v7, "priority"));
      if (objc_msgSend(v7, "hasInternalBuildOnly"))
        v23 = objc_msgSend(v7, "internalBuildOnly");
      else
        v23 = 0;
      objc_msgSend(v14, "setInternalBuildOnly:", v23);
      if ((objc_msgSend(v7, "hasDeploymentDate") & 1) != 0)
      {
        objc_msgSend(v7, "deploymentDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDeploymentDate:", v25);

      }
      else
      {
        objc_msgSend(v14, "setDeploymentDate:", 0);
      }
      if (objc_msgSend(v7, "namespacesArray_Count"))
      {
        objc_msgSend(v7, "namespacesArray");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setNamespaces:", v26);

      }
      else
      {
        objc_msgSend(v14, "setNamespaces:", 0);
      }
      objc_msgSend(v14, "setDeploymentEnvironment:", objc_msgSend(v7, "deploymentEnvironment"));
      if (objc_msgSend(v7, "namespaceCompatibilityVersionsArray_Count"))
      {
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "namespaceCompatibilityVersionsArray_Count"));
        objc_msgSend(v7, "namespaceCompatibilityVersionsArray");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __51__TRIClientExperimentArtifact_parseFromData_error___block_invoke;
        v31[3] = &unk_1E93306F0;
        v32 = v27;
        v29 = v27;
        objc_msgSend(v28, "enumerateValuesWithBlock:", v31);

        objc_msgSend(v14, "setNamespaceCompatibilityVersions:", v29);
      }
      goto LABEL_34;
    }
    if (a4)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("TRIPersistedExperimentArtifact has nil experimentId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v15);
      v18 = *a4;
      *a4 = v17;

      v14 = 0;
      goto LABEL_34;
    }
  }
  else if (a4)
  {
    v13 = v8;
    v14 = 0;
    v15 = *a4;
    *a4 = v13;
LABEL_34:

    goto LABEL_35;
  }
  v14 = 0;
LABEL_35:

  objc_autoreleasePoolPop(v6);
  return v14;
}

void __51__TRIClientExperimentArtifact_parseFromData_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientExperimentArtifact.m"), 409, CFSTR("Do not use NSSecureCoding to persist TRIClientExperimentArtifact to disk. Use protobuf serialization."));

  }
  -[TRIClientExperimentArtifact data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (TRIClientExperimentArtifact)initWithCoder:(id)a3
{
  id v4;
  TRIClientExperimentArtifact *v5;
  void *v6;
  TRIClientExperimentArtifact *v7;
  TRIClientExperimentArtifact *v8;
  TRIClientExperimentArtifact *v9;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRIClientExperimentArtifact;
  v5 = -[TRIClientExperimentArtifact init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11 = 0;
      +[TRIClientExperimentArtifact parseFromData:error:](TRIClientExperimentArtifact, "parseFromData:error:", v6, &v11);
      v7 = (TRIClientExperimentArtifact *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        v9 = v7;
      else
        objc_msgSend(v4, "failWithError:", v11);

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

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TRIClientExperimentArtifact experimentDeployment](self, "experimentDeployment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TRIClientExperimentArtifact *v4;
  TRIClientExperimentArtifact *v5;
  TRIClientExperimentArtifact *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  int v12;
  int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  int v23;
  int v24;
  int v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;

  v4 = (TRIClientExperimentArtifact *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[TRIClientExperimentArtifact experimentDeployment](self, "experimentDeployment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact experimentDeployment](v6, "experimentDeployment");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v8)
        {

        }
        else
        {
          v9 = (void *)v8;
          v10 = 0;
          if (!v7 || !v8)
            goto LABEL_52;
          v11 = objc_msgSend(v7, "isEqualToDeployment:", v8);

          if ((v11 & 1) == 0)
            goto LABEL_36;
        }
        v12 = -[TRIClientExperimentArtifact deploymentEnvironment](self, "deploymentEnvironment");
        if (v12 != -[TRIClientExperimentArtifact deploymentEnvironment](v6, "deploymentEnvironment"))
          goto LABEL_36;
        v13 = -[TRIClientExperimentArtifact cloudKitContainer](self, "cloudKitContainer");
        if (v13 != -[TRIClientExperimentArtifact cloudKitContainer](v6, "cloudKitContainer"))
          goto LABEL_36;
        -[TRIClientExperimentArtifact teamId](self, "teamId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact teamId](v6, "teamId");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v14)
        {

        }
        else
        {
          v9 = (void *)v14;
          v10 = 0;
          if (!v7 || !v14)
            goto LABEL_52;
          v15 = objc_msgSend(v7, "isEqualToString:", v14);

          if ((v15 & 1) == 0)
            goto LABEL_36;
        }
        -[TRIClientExperimentArtifact encodedExperimentDefinition](self, "encodedExperimentDefinition");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact encodedExperimentDefinition](v6, "encodedExperimentDefinition");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v16)
        {

        }
        else
        {
          v9 = (void *)v16;
          v10 = 0;
          if (!v7 || !v16)
            goto LABEL_52;
          v17 = objc_msgSend(v7, "isEqualToData:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_36;
        }
        -[TRIClientExperimentArtifact encodedExperimentDefinitionSignature](self, "encodedExperimentDefinitionSignature");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact encodedExperimentDefinitionSignature](v6, "encodedExperimentDefinitionSignature");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v18)
        {

        }
        else
        {
          v9 = (void *)v18;
          v10 = 0;
          if (!v7 || !v18)
            goto LABEL_52;
          v19 = objc_msgSend(v7, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
            goto LABEL_36;
        }
        -[TRIClientExperimentArtifact publicCertificate](self, "publicCertificate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact publicCertificate](v6, "publicCertificate");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v20)
        {

        }
        else
        {
          v9 = (void *)v20;
          v10 = 0;
          if (!v7 || !v20)
            goto LABEL_52;
          v21 = objc_msgSend(v7, "isEqualToData:", v20);

          if ((v21 & 1) == 0)
          {
LABEL_36:
            v10 = 0;
LABEL_53:

            goto LABEL_54;
          }
        }
        -[TRIClientExperimentArtifact experiment](self, "experiment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact experiment](v6, "experiment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v7, "isEqual:", v9);
        if ((v22 & 1) == 0)
        {
          -[TRIClientExperimentArtifact experiment](self, "experiment");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v10 = 0;
LABEL_51:

LABEL_52:
            goto LABEL_53;
          }
          -[TRIClientExperimentArtifact experiment](v6, "experiment");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v10 = 0;
LABEL_49:

LABEL_50:
            v27 = 0;
            goto LABEL_51;
          }
        }
        v23 = -[TRIClientExperimentArtifact experimentState](self, "experimentState");
        if (v23 != -[TRIClientExperimentArtifact experimentState](v6, "experimentState")
          || (v24 = -[TRIClientExperimentArtifact experimentType](self, "experimentType"),
              v24 != -[TRIClientExperimentArtifact experimentType](v6, "experimentType"))
          || (v25 = -[TRIClientExperimentArtifact experimentPriority](self, "experimentPriority"),
              v25 != -[TRIClientExperimentArtifact experimentPriority](v6, "experimentPriority"))
          || (v26 = -[TRIClientExperimentArtifact internalBuildOnly](self, "internalBuildOnly"),
              v26 != -[TRIClientExperimentArtifact internalBuildOnly](v6, "internalBuildOnly")))
        {
LABEL_43:
          v10 = 0;
          if ((v22 & 1) != 0)
            goto LABEL_52;
          goto LABEL_50;
        }
        -[TRIClientExperimentArtifact deploymentDate](self, "deploymentDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact deploymentDate](v6, "deploymentDate");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v30 == (void *)v31)
        {

        }
        else
        {
          v32 = (void *)v31;
          if (!v30 || !v31)
            goto LABEL_66;
          v33 = objc_msgSend(v30, "isEqualToDate:", v31);

          if ((v33 & 1) == 0)
            goto LABEL_43;
        }
        -[TRIClientExperimentArtifact namespaces](self, "namespaces");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TRIClientExperimentArtifact namespaces](v6, "namespaces");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v30 == (void *)v34)
        {

LABEL_69:
          -[TRIClientExperimentArtifact namespaceCompatibilityVersions](self, "namespaceCompatibilityVersions");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIClientExperimentArtifact namespaceCompatibilityVersions](v6, "namespaceCompatibilityVersions");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          if (v36 == (void *)v37)
          {
            v10 = 1;
          }
          else
          {
            v10 = 0;
            if (v36 && v37)
              v10 = objc_msgSend(v36, "isEqualToArray:", v37);
          }

          if ((v22 & 1) != 0)
            goto LABEL_52;
LABEL_75:
          v28 = 0;
          goto LABEL_49;
        }
        v32 = (void *)v34;
        if (v30 && v34)
        {
          v35 = objc_msgSend(v30, "isEqualToArray:", v34);

          if ((v35 & 1) == 0)
            goto LABEL_43;
          goto LABEL_69;
        }
LABEL_66:

        v10 = 0;
        if ((v22 & 1) != 0)
          goto LABEL_52;
        goto LABEL_75;
      }
    }
    v10 = 0;
  }
LABEL_54:

  return v10;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (int)deploymentEnvironment
{
  return self->_deploymentEnvironment;
}

- (void)setDeploymentEnvironment:(int)a3
{
  self->_deploymentEnvironment = a3;
}

- (int)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (void)setCloudKitContainer:(int)a3
{
  self->_cloudKitContainer = a3;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_teamId, a3);
}

- (NSData)encodedExperimentDefinition
{
  return self->_encodedExperimentDefinition;
}

- (void)setEncodedExperimentDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_encodedExperimentDefinition, a3);
}

- (NSString)encodedExperimentDefinitionSignature
{
  return self->_encodedExperimentDefinitionSignature;
}

- (void)setEncodedExperimentDefinitionSignature:(id)a3
{
  objc_storeStrong((id *)&self->_encodedExperimentDefinitionSignature, a3);
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void)setPublicCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_publicCertificate, a3);
}

- (int)experimentState
{
  return self->_experimentState;
}

- (void)setExperimentState:(int)a3
{
  self->_experimentState = a3;
}

- (int)experimentType
{
  return self->_experimentType;
}

- (void)setExperimentType:(int)a3
{
  self->_experimentType = a3;
}

- (int)experimentPriority
{
  return self->_experimentPriority;
}

- (void)setExperimentPriority:(int)a3
{
  self->_experimentPriority = a3;
}

- (BOOL)internalBuildOnly
{
  return self->_internalBuildOnly;
}

- (void)setInternalBuildOnly:(BOOL)a3
{
  self->_internalBuildOnly = a3;
}

- (NSDate)deploymentDate
{
  return self->_deploymentDate;
}

- (void)setDeploymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentDate, a3);
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
  objc_storeStrong((id *)&self->_namespaces, a3);
}

- (NSArray)namespaceCompatibilityVersions
{
  return self->_namespaceCompatibilityVersions;
}

- (void)setNamespaceCompatibilityVersions:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceCompatibilityVersions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceCompatibilityVersions, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_deploymentDate, 0);
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_encodedExperimentDefinitionSignature, 0);
  objc_storeStrong((id *)&self->_encodedExperimentDefinition, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0CE8];
  v10[0] = *MEMORY[0x1E0DC0D10];
  v10[1] = v2;
  v3 = *MEMORY[0x1E0DC0D00];
  v10[2] = *MEMORY[0x1E0DC0CE0];
  v10[3] = v3;
  v4 = *MEMORY[0x1E0DC0D50];
  v10[4] = *MEMORY[0x1E0DC0D08];
  v10[5] = v4;
  v5 = *MEMORY[0x1E0DC0D28];
  v10[6] = *MEMORY[0x1E0DC0D20];
  v10[7] = v5;
  v6 = *MEMORY[0x1E0DC0D30];
  v10[8] = *MEMORY[0x1E0DC0D18];
  v10[9] = v6;
  v7 = *MEMORY[0x1E0DC0D38];
  v10[10] = *MEMORY[0x1E0DC0CF8];
  v10[11] = v7;
  v8 = *MEMORY[0x1E0DC0CD8];
  v10[12] = *MEMORY[0x1E0DC0D40];
  v10[13] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecordResult:(id)a3 withNamespaceDescriptorProvider:(id)a4 container:(int)a5 teamId:(id)a6 requireDeploymentId:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id *v71;
  uint64_t *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;
  _QWORD v101[3];

  v9 = a7;
  v11 = *(_QWORD *)&a5;
  v101[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a8;
  objc_msgSend(v13, "values");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0D10], 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0CE8], 0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
      v21 = (void *)v20;
    else
      v21 = &unk_1E9363EE8;
    if (v20)
      v22 = 1;
    else
      v22 = !v9;
    v86 = v14;
    if (!v22)
    {
      TRILogCategory_Server();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "recordID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v97 = v80;
        v98 = 2112;
        v99 = v19;
        _os_log_error_impl(&dword_1D207F000, v45, OS_LOG_TYPE_ERROR, "CloudKit record %@ with experiment %@ is missing the deployment id", buf, 0x16u);

      }
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "recordID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("CloudKit record %@ with experiment %@ is missing the deployment id"), v48, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v94 = *MEMORY[0x1E0CB2D50];
      v95 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v50);

      v16[2](v16, 0, v51);
      v44 = 0;
      goto LABEL_55;
    }
    v85 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A30]), "initWithExperimentId:deploymentId:", v19, objc_msgSend(v21, "intValue"));
    +[TRIClientExperimentArtifact artifactWithExperiment:](TRIClientExperimentArtifact, "artifactWithExperiment:");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCloudKitContainer:", v11);
    objc_msgSend(v23, "setTeamId:", v15);
    objc_msgSend(v18, "triDataForField:", *MEMORY[0x1E0DC0D00]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEncodedExperimentDefinition:", v24);

    objc_msgSend(v18, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0D08], 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setEncodedExperimentDefinitionSignature:", v25);

    objc_msgSend(v18, "triDataForField:", *MEMORY[0x1E0DC0D50]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPublicCertificate:", v26);

    objc_msgSend(v18, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D40], 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNamespaces:", v27);

    objc_msgSend(v18, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D38], 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNamespaceCompatibilityVersions:", v28);

    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0D20], 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "intValue");
      if (TRICloudKitSupport_NotificationStatus_IsValidValue())
        objc_msgSend(v23, "setExperimentState:", objc_msgSend(v30, "intValue"));
    }

    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0D28], 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "intValue");
      if (TRICloudKitSupport_NotificationType_IsValidValue())
        objc_msgSend(v23, "setExperimentType:", objc_msgSend(v32, "intValue"));
    }

    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0D18], 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "intValue");
      if (TRICloudKitSupport_NotificationPriority_IsValidValue())
        objc_msgSend(v23, "setExperimentPriority:", objc_msgSend(v34, "intValue"));
    }

    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0D30], 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 && objc_msgSend(&unk_1E9363888, "containsObject:", v35))
      objc_msgSend(v23, "setInternalBuildOnly:", objc_msgSend(v35, "BOOLValue"));

    objc_msgSend(v18, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0CE0], 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      objc_msgSend(v36, "intValue");
      if (!TRIDeploymentEnvironment_IsValidValue())
      {
        v84 = v15;
        TRILogCategory_Server();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v23, "experimentId");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v97 = v81;
          v98 = 2112;
          v99 = v37;
          _os_log_error_impl(&dword_1D207F000, v58, OS_LOG_TYPE_ERROR, "received CloudKit record for experimentId %@ with unsupported deployment environment %@", buf, 0x16u);

        }
        v59 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "experimentId");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", CFSTR("received CloudKit record for experimentId %@ with unsupported deployment environment %@"), v60, v37);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v92 = *MEMORY[0x1E0CB2D50];
        v93 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_msgSend(v62, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v63);

        v16[2](v16, 0, v64);
        v44 = 0;
        v15 = v84;
        v51 = (void *)v85;
        goto LABEL_54;
      }
      v38 = objc_msgSend(v37, "intValue");
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v23, "setDeploymentEnvironment:", v38);

    objc_msgSend(v18, "triDateForField:", *MEMORY[0x1E0DC0D88]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDeploymentDate:", v52);

    TRILogCategory_Server();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "experimentId");
      v54 = v15;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v97 = v55;
      _os_log_impl(&dword_1D207F000, v53, OS_LOG_TYPE_DEFAULT, "received CloudKit record with experiment id: %@", buf, 0xCu);

      v15 = v54;
    }

    v87 = 0;
    objc_msgSend(v23, "experimentId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      if (objc_msgSend(v23, "experimentType") == 2 || (objc_msgSend(v23, "isValid") & 1) != 0)
      {
        if ((objc_msgSend(v23, "isCompatibleWithNamespaceDescriptorProvider:error:", v86, &v87) & 1) != 0)
        {
          v57 = 4;
          v51 = (void *)v85;
LABEL_53:
          v16[2](v16, v57, v87);
          v23 = v23;

          v44 = v23;
LABEL_54:

LABEL_55:
          v14 = v86;
          goto LABEL_56;
        }
        TRILogCategory_Server();
        v73 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v85;
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
LABEL_52:

          v23 = 0;
          v57 = 0;
          goto LABEL_53;
        }
        objc_msgSend(v23, "experimentId");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v97 = v74;
        _os_log_error_impl(&dword_1D207F000, v73, OS_LOG_TYPE_ERROR, "experiment with id %@ is incompatible", buf, 0xCu);

LABEL_51:
        v51 = (void *)v85;
        goto LABEL_52;
      }
      v65 = v15;
      TRILogCategory_Server();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "experimentId");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v97 = v83;
        _os_log_error_impl(&dword_1D207F000, v75, OS_LOG_TYPE_ERROR, "invalid signature for experiment id %@", buf, 0xCu);

      }
      v76 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(0, "experimentId");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stringWithFormat:", CFSTR("invalid signature for experiment id %@"), v77);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v88 = *MEMORY[0x1E0CB2D50];
      v89 = v23;
      v70 = (void *)MEMORY[0x1E0C99D80];
      v71 = &v89;
      v72 = &v88;
    }
    else
    {
      v65 = v15;
      TRILogCategory_Server();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "recordID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v97 = v82;
        _os_log_error_impl(&dword_1D207F000, v66, OS_LOG_TYPE_ERROR, "experiment id is nil for artifact with CKRecord %@", buf, 0xCu);

      }
      v67 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "recordID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "stringWithFormat:", CFSTR("experiment id is nil for artifact with CKRecord %@"), v68);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v90 = *MEMORY[0x1E0CB2D50];
      v91 = v23;
      v70 = (void *)MEMORY[0x1E0C99D80];
      v71 = &v91;
      v72 = &v90;
    }
    objc_msgSend(v70, "dictionaryWithObjects:forKeys:count:", v71, v72, 1);
    v73 = objc_claimAutoreleasedReturnValue();
    v87 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v73);
    v15 = v65;
    goto LABEL_51;
  }
  TRILogCategory_Server();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "recordID");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v97 = v79;
    _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "could not create experiment artifact from CloudKit record %@", buf, 0xCu);

  }
  v40 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "recordID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("could not create experiment artifact from CloudKit record %@"), v41);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v100 = *MEMORY[0x1E0CB2D50];
  v101[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v42, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v43);

  v16[2](v16, 0, v21);
  v44 = 0;
LABEL_56:

  return v44;
}

@end
