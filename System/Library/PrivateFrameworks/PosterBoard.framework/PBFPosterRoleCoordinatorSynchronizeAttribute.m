@implementation PBFPosterRoleCoordinatorSynchronizeAttribute

uint64_t ___PBFPosterRoleCoordinatorSynchronizeAttribute_block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "attributeType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0D7FC28]))
  {
    v7 = (void *)MEMORY[0x1E0D7FB50];
    objc_msgSend(*(id *)(a1 + 32), "_path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "storeFocusConfigurationForPath:focusConfiguration:error:", v8, v5, a3);

    if ((v7 & 1) == 0)
    {
      PBFLogRoleCoordinator();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_11;
      goto LABEL_9;
    }
  }
  else if (objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0D7FC18]))
  {
    v10 = (void *)MEMORY[0x1E0D7FB50];
    objc_msgSend(*(id *)(a1 + 32), "_path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "storeAmbientConfigurationForPath:ambientConfiguration:error:", v11, v5, a3);

    if ((v10 & 1) == 0)
    {
      PBFLogRoleCoordinator();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "role");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pbf_posterUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *a3;
        v17 = 138544130;
        v18 = v14;
        v19 = 2114;
        v20 = v15;
        v21 = 2114;
        v22 = v6;
        v23 = 2114;
        v24 = v16;
        _os_log_fault_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to synchronize attribute %{public}@ to disk for posterUUID %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);

      }
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
  }
  v12 = 1;
LABEL_10:

  return v12;
}

uint64_t ___PBFPosterRoleCoordinatorSynchronizeAttribute_block_invoke_341(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pbf_posterUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeJSON");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v7, v8, v9, v10, a3);

  if ((v6 & 1) == 0)
  {
    PBFLogRoleCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "role");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "pbf_posterUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributeType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      v17 = 138544130;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      _os_log_fault_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_FAULT, "[%{public}@] Failed to synchronize attribute %{public}@ to database for posterUUID %{public}@: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
  }

  return 1;
}

@end
