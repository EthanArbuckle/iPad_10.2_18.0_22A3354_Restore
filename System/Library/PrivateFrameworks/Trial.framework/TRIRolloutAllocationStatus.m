@implementation TRIRolloutAllocationStatus

- (TRIRolloutAllocationStatus)initWithRolloutId:(id)a3 deploymentId:(int)a4 rampId:(id)a5 factorPackIds:(id)a6
{
  id v12;
  id v13;
  id v14;
  TRIRolloutAllocationStatus *v15;
  TRIRolloutAllocationStatus *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentId"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rolloutId"));

  if (!a4)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 965, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackIds"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)TRIRolloutAllocationStatus;
  v15 = -[TRIRolloutAllocationStatus init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rolloutId, a3);
    v16->_deploymentId = a4;
    objc_storeStrong((id *)&v16->_rampId, a5);
    objc_storeStrong((id *)&v16->_factorPackIds, a6);
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = self->_deploymentId + 37 * -[NSString hash](self->_rolloutId, "hash");
  return -[NSDictionary hash](self->_factorPackIds, "hash") + 37 * v3;
}

- (TRIRolloutAllocationStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  TRIRolloutAllocationStatus *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedRolloutAllocationStatus, "parseFromData:error:", v5, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v6)
    {
      if (objc_msgSend(v6, "hasRolloutId") && objc_msgSend(v6, "hasDeploymentId"))
      {
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__7;
        v19 = __Block_byref_object_dispose__7;
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "namespaceFactorPackArray_Count"));
        objc_msgSend(v6, "namespaceFactorPackArray");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __44__TRIRolloutAllocationStatus_initWithCoder___block_invoke;
        v14[3] = &unk_1E3BFFA90;
        v14[4] = &v15;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

        if (v16[5])
        {
          objc_msgSend(v6, "rolloutId");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v6, "deploymentId");
          objc_msgSend(v6, "rampId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[TRIRolloutAllocationStatus initWithRolloutId:deploymentId:rampId:factorPackIds:](self, "initWithRolloutId:deploymentId:rampId:factorPackIds:", v9, v10, v11, v16[5]);

          v12 = self;
        }
        else
        {
          v12 = 0;
        }
        _Block_object_dispose(&v15, 8);

        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v4, "failWithError:", v7);
    }
    v12 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

void __44__TRIRolloutAllocationStatus_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "hasNamespace_p") && (objc_msgSend(v11, "hasFactorPack") & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v11, "factorPack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "namespace_p");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    *a4 = 1;
  }

}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  NSDictionary *factorPackIds;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRolloutId:", self->_rolloutId);
  objc_msgSend(v5, "setDeploymentId:", self->_deploymentId);
  objc_msgSend(v5, "setRampId:", self->_rampId);
  factorPackIds = self->_factorPackIds;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__TRIRolloutAllocationStatus_encodeWithCoder___block_invoke;
  v11[3] = &unk_1E3BFFAB8;
  v7 = v5;
  v12 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](factorPackIds, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 1033, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("data"));

}

void __46__TRIRolloutAllocationStatus_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setNamespace_p:", v6);

  objc_msgSend(v8, "setFactorPack:", v5);
  objc_msgSend(*(id *)(a1 + 32), "namespaceFactorPackArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)rampId
{
  return self->_rampId;
}

- (NSDictionary)factorPackIds
{
  return self->_factorPackIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorPackIds, 0);
  objc_storeStrong((id *)&self->_rampId, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end
