@implementation REMAuxiliaryChangeInfoFetchResult

- (REMAuxiliaryChangeInfoFetchResult)initWithAuxiliaryChangeInfoType:(Class)a3
{
  REMAuxiliaryChangeInfoFetchResult *v4;
  REMAuxiliaryChangeInfoFetchResult *v5;
  uint64_t v6;
  NSMutableDictionary *changeObjectForAuxiliaryChangeInfoMap;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMAuxiliaryChangeInfoFetchResult;
  v4 = -[REMAuxiliaryChangeInfoFetchResult init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_typedKlass = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    changeObjectForAuxiliaryChangeInfoMap = v5->_changeObjectForAuxiliaryChangeInfoMap;
    v5->_changeObjectForAuxiliaryChangeInfoMap = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)changeObjectForAuxiliaryChangeInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[REMAuxiliaryChangeInfoFetchResult changeObjectForAuxiliaryChangeInfoMap](self, "changeObjectForAuxiliaryChangeInfoMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)auxiliaryChangeInfos
{
  return self->_auxiliaryChangeInfos;
}

- (Class)typedKlass
{
  return self->_typedKlass;
}

- (void)setTypedKlass:(Class)a3
{
  self->_typedKlass = a3;
}

- (NSMutableDictionary)changeObjectForAuxiliaryChangeInfoMap
{
  return self->_changeObjectForAuxiliaryChangeInfoMap;
}

- (void)setChangeObjectForAuxiliaryChangeInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_changeObjectForAuxiliaryChangeInfoMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObjectForAuxiliaryChangeInfoMap, 0);
  objc_storeStrong((id *)&self->_auxiliaryChangeInfos, 0);
}

+ (id)auxiliaryChangeInfoFetchResultOfType:(Class)a3
{
  return -[REMAuxiliaryChangeInfoFetchResult initWithAuxiliaryChangeInfoType:]([REMAuxiliaryChangeInfoFetchResult alloc], "initWithAuxiliaryChangeInfoType:", a3);
}

- (id)auxiliaryChangeInfoFromData:(id)a3 withObjectID:(id)a4 fromChangeObject:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_class();
  v14 = objc_alloc(-[REMAuxiliaryChangeInfoFetchResult typedKlass](self, "typedKlass"));
  REMCheckedDynamicCast(v13, (uint64_t)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v15, "initWithREMObjectID:", v11);
  if (v16)
  {
    v31 = v12;
    v32 = 0;
    v30 = v10;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, &v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v32;
    v19 = v18;
    if (!v17 || v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:underlyingError:", 10, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[REMLog changeTracking](REMLog, "changeTracking");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(-[REMAuxiliaryChangeInfoFetchResult typedKlass](self, "typedKlass"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localizedDescription](v19, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v25;
        v35 = 2114;
        v36 = v11;
        v37 = 2114;
        v38 = v26;
        _os_log_error_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_ERROR, "REMChangeTracking+AuxiliaryChgInfo: Failed to decode data to plist dictionary for {class: %{public}@, remObjectID: %{public}@, plistError: %{public}@}", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("identifier"));
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v20);
        v22 = v21;
        if (v21)
        {
          objc_msgSend((id)objc_opt_class(), "objectIDWithUUID:", v21);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        if ((-[NSObject isEqual:](v21, "isEqual:", v11, v21) & 1) != 0)
        {
          objc_msgSend(v16, "setStorage:", v17);
          -[REMAuxiliaryChangeInfoFetchResult changeObjectForAuxiliaryChangeInfoMap](self, "changeObjectForAuxiliaryChangeInfoMap");
          v23 = objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v31, v11);
          v24 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 10);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[REMLog changeTracking](REMLog, "changeTracking");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            NSStringFromClass(-[REMAuxiliaryChangeInfoFetchResult typedKlass](self, "typedKlass"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v34 = v28;
            v35 = 2114;
            v36 = v11;
            v37 = 2114;
            v38 = v29;
            _os_log_error_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_ERROR, "REMChangeTracking+AuxiliaryChgInfo: Decoded object identifier from the plist dictionary does not match with input object ID for {class: %{public}@, remObjectID: %{public}@, decodedObjID: %{public}@}", buf, 0x20u);

          }
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[REMLog changeTracking](REMLog, "changeTracking");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess) auxiliaryChangeInfoFromData:withObjectID:fromChangeObject:error:].cold.2(self);
      }

    }
    v10 = v30;
    v12 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMLog changeTracking](REMLog, "changeTracking");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess) auxiliaryChangeInfoFromData:withObjectID:fromChangeObject:error:].cold.1(self);
  }

  if (a6)
    *a6 = objc_retainAutorelease(v24);

  return v16;
}

- (void)setAuxiliaryChangeInfos:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryChangeInfos, a3);
}

@end
