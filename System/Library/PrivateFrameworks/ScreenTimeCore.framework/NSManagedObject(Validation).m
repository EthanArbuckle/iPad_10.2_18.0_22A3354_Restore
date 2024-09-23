@implementation NSManagedObject(Validation)

- (uint64_t)parseValidationErrors:()Validation otherErrors:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_14;
  v21 = a3;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        +[STLog coreDataValidation](STLog, "coreDataValidation");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v11;
          _os_log_fault_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_FAULT, "ScreenTime CoreData Validation failed with: %{public}@", buf, 0xCu);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v13 = 0;
      *v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB28A8];
      v17 = *MEMORY[0x1E0CB2938];
      v27[0] = CFSTR("ScreenTime Multiple validation errors occurred.");
      v18 = *MEMORY[0x1E0C97848];
      v26[0] = v17;
      v26[1] = v18;
      v19 = (void *)objc_msgSend(v6, "copy");
      v27[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1560, v20);
      *v21 = (id)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }
  }
  else
  {
LABEL_14:
    v13 = 1;
  }

  return v13;
}

@end
