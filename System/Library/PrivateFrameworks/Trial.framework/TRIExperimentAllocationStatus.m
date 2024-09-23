@implementation TRIExperimentAllocationStatus

- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7 namespaces:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  TRIExperimentAllocationStatus *v18;
  TRIExperimentAllocationStatus *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v12 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 829, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 831, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("treatmentId"));

      if (v17)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("experimentId"));

  if (!v16)
    goto LABEL_10;
LABEL_4:
  if (v17)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 832, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaces"));

LABEL_5:
  v26.receiver = self;
  v26.super_class = (Class)TRIExperimentAllocationStatus;
  v18 = -[TRIAllocationStatus initWithType:date:](&v26, sel_initWithType_date_, v12, v14);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_experimentId, a5);
    v19->_deploymentId = a6;
    objc_storeStrong((id *)&v19->_treatmentId, a7);
    objc_storeStrong((id *)&v19->_namespaces, a8);
  }

  return v19;
}

- (TRIExperimentAllocationStatus)initWithType:(unsigned __int8)a3 date:(id)a4 experimentId:(id)a5 deploymentId:(int)a6 treatmentId:(id)a7
{
  return -[TRIExperimentAllocationStatus initWithType:date:experimentId:deploymentId:treatmentId:namespaces:](self, "initWithType:date:experimentId:deploymentId:treatmentId:namespaces:", a3, a4, a5, *(_QWORD *)&a6, a7, MEMORY[0x1E0C9AA60]);
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4;
  id *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)TRIExperimentAllocationStatus;
    if (-[TRIAllocationStatus isEqualToStatus:](&v13, sel_isEqualToStatus_, v4))
    {
      v5 = (id *)v4;
      if (-[NSString isEqualToString:](self->_experimentId, "isEqualToString:", v5[4])
        && self->_deploymentId == *((_DWORD *)v5 + 6))
      {
        v6 = self->_treatmentId;
        v7 = (NSString *)v5[5];
        if (v6 == v7)
        {

LABEL_15:
          v10 = -[NSArray isEqualToArray:](self->_namespaces, "isEqualToArray:", v5[6]);
LABEL_17:

          goto LABEL_18;
        }
        v8 = v7;
        if (v6)
          v9 = v7 == 0;
        else
          v9 = 1;
        if (v9)
        {

        }
        else
        {
          v11 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

          if (v11)
            goto LABEL_15;
        }
      }
      v10 = 0;
      goto LABEL_17;
    }
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIExperimentAllocationStatus;
  v3 = -[TRIAllocationStatus hash](&v7, sel_hash);
  v4 = self->_deploymentId + 37 * (-[NSString hash](self->_experimentId, "hash") + 37 * v3);
  v5 = -[NSString hash](self->_treatmentId, "hash") + 37 * v4;
  return -[NSArray hash](self->_namespaces, "hash") + 37 * v5;
}

- (TRIExperimentAllocationStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  TRIExperimentAllocationStatus *v17;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v29 = 0;
    +[TRIPBMessage parseFromData:error:](TRIPersistedExperimentAllocationStatus, "parseFromData:error:", v5, &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (!v6)
    {
      objc_msgSend(v4, "failWithError:", v7);
      goto LABEL_15;
    }
    if (objc_msgSend(v6, "hasCommon"))
    {
      objc_msgSend(v6, "common");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "hasType") & 1) != 0)
      {
        objc_msgSend(v6, "common");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasTimestamp")
          && objc_msgSend(v6, "hasExperimentId")
          && (objc_msgSend(v6, "hasDeploymentId") & 1) != 0)
        {
          v10 = objc_msgSend(v6, "hasTreatmentId");

          if (v10)
          {
            v23 = 0;
            v24 = &v23;
            v25 = 0x3032000000;
            v26 = __Block_byref_object_copy__7;
            v27 = __Block_byref_object_dispose__7;
            v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "namespaceArray_Count"));
            objc_msgSend(v6, "namespaceArray");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __47__TRIExperimentAllocationStatus_initWithCoder___block_invoke;
            v22[3] = &unk_1E3BFFA68;
            v22[4] = &v23;
            objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);

            if (v24[5])
            {
              objc_msgSend(v6, "common");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v21, "type");
              objc_msgSend(v6, "common");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timestamp");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "date");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "experimentId");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v6, "deploymentId");
              objc_msgSend(v6, "treatmentId");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              self = -[TRIExperimentAllocationStatus initWithType:date:experimentId:deploymentId:treatmentId:namespaces:](self, "initWithType:date:experimentId:deploymentId:treatmentId:namespaces:", v19, v13, v14, v15, v16, v24[5]);

              v17 = self;
            }
            else
            {
              v17 = 0;
            }
            _Block_object_dispose(&v23, 8);

            goto LABEL_16;
          }
          goto LABEL_15;
        }

      }
    }
LABEL_15:
    v17 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v17 = 0;
LABEL_17:

  return v17;
}

void __47__TRIExperimentAllocationStatus_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  TRIVersionedNamespace *v6;
  void *v7;
  TRIVersionedNamespace *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "hasName") && (objc_msgSend(v11, "hasCompatibilityVersion") & 1) != 0)
  {
    v6 = [TRIVersionedNamespace alloc];
    objc_msgSend(v11, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TRIVersionedNamespace initWithName:compatibilityVersion:](v6, "initWithName:compatibilityVersion:", v7, objc_msgSend(v11, "compatibilityVersion"));

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);
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
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
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
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v4 = (void *)objc_opt_new();
  v5 = -[TRIAllocationStatus type](self, "type");
  objc_msgSend(v4, "common");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setType:", v5);

  v7 = objc_alloc(MEMORY[0x1E0DC0F50]);
  -[TRIAllocationStatus date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDate:", v8);
  objc_msgSend(v4, "common");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimestamp:", v9);

  objc_msgSend(v4, "setExperimentId:", self->_experimentId);
  objc_msgSend(v4, "setDeploymentId:", self->_deploymentId);
  objc_msgSend(v4, "setTreatmentId:", self->_treatmentId);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_namespaces;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = (void *)objc_opt_new();
        objc_msgSend(v16, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setName:", v18);

        objc_msgSend(v17, "setCompatibilityVersion:", objc_msgSend(v16, "compatibilityVersion"));
        objc_msgSend(v4, "namespaceArray");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v17);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  objc_msgSend(v4, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  objc_msgSend(v23, "encodeObject:forKey:", v20, CFSTR("data"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSArray)namespaces
{
  return self->_namespaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

@end
