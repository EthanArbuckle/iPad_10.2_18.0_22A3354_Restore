@implementation RTPersistenceExpirationEnforcer

- (RTPersistenceExpirationEnforcer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTPersistenceExpirationEnforcer)initWithPersistenceManager:(id)a3
{
  id v5;
  RTPersistenceExpirationEnforcer *v6;
  RTPersistenceExpirationEnforcer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  RTPersistenceExpirationEnforcer *v25;
  NSObject *v26;
  void *v28;
  objc_super v29;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTPersistenceExpirationEnforcer;
    v6 = -[RTPersistenceExpirationEnforcer init](&v29, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      v28 = (void *)MEMORY[0x1E0C99E60];
      +[RTAddressMO entity](RTAddressMO, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTDeviceMO entity](RTDeviceMO, "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTEntityDeletionRequestMO entity](RTEntityDeletionRequestMO, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTMapItemMO entity](RTMapItemMO, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithObjects:", v9, v11, v13, v15, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)_MergedGlobals_101;
      _MergedGlobals_101 = v16;

      v18 = (void *)MEMORY[0x1E0C99E60];
      +[RTDeviceMO entity](RTDeviceMO, "entity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTEntityDeletionRequestMO entity](RTEntityDeletionRequestMO, "entity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithObjects:", v20, v22, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)qword_1ED9429D8;
      qword_1ED9429D8 = v23;

    }
    self = v7;
    v25 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (id)entitiesWithDeviceAndExpirationProperty:(id)a3 ownedByThisDevice:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K != nil"), CFSTR("propertiesByName"), CFSTR("expirationDate"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  v20 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K != nil"), CFSTR("propertiesByName"), CFSTR("device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  v9 = &_MergedGlobals_101;
  if (!v4)
    v9 = &qword_1ED9429D8;
  v10 = (id)*v9;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("name"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v6, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)collectRecordIDsByTypeExpiredBeforeDate:(id)a3 ownedByThisDevice:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t *v30;
  SEL v31;
  BOOL v32;
  uint8_t buf[8];
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (a6)
  {
    if (v11)
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v34 = buf;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__91;
        v37 = __Block_byref_object_dispose__91;
        v38 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __107__RTPersistenceExpirationEnforcer_collectRecordIDsByTypeExpiredBeforeDate_ownedByThisDevice_context_error___block_invoke;
        v26[3] = &unk_1E92A0558;
        v26[4] = self;
        v32 = a4;
        v27 = v13;
        v30 = buf;
        v28 = v11;
        v31 = a2;
        v15 = v14;
        v29 = v15;
        objc_msgSend(v27, "performBlockAndWait:", v26);
        _RTSafeArray();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        _RTSafeArray();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        if (v17)
          v19 = 0;
        else
          v19 = (void *)*((_QWORD *)v34 + 5);
        v21 = v19;

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v23 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      v23 = CFSTR("referenceDate");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v21 = 0;
LABEL_18:

  return v21;
}

void __107__RTPersistenceExpirationEnforcer_collectRecordIDsByTypeExpiredBeforeDate_ownedByThisDevice_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "entitiesWithDeviceAndExpirationProperty:ownedByThisDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(unsigned __int8 *)(a1 + 80);
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "currentDevice");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = CFSTR("%K == %@ && %K <= %@");
  else
    v10 = CFSTR("%K != %@ && %K <= %@");
  objc_msgSend(v7, "predicateWithFormat:", v10, CFSTR("device"), v8, CFSTR("expirationDate"), *(_QWORD *)(a1 + 48));
  v11 = objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v2;
  v13 = (void *)v11;
  v14 = v12;
  v36 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v36)
  {
    v15 = *(_QWORD *)v39;
    v34 = v14;
    v35 = *(_QWORD *)v39;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v14);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v16);
        v18 = objc_alloc(MEMORY[0x1E0C97B48]);
        objc_msgSend(v17, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithEntityName:", v19);

        objc_msgSend(v20, "setResultType:", 1);
        objc_msgSend(v20, "setPredicate:", v13);
        v21 = *(void **)(a1 + 40);
        v37 = 0;
        objc_msgSend(v21, "executeFetchRequest:error:", v20, &v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v37;
        if (v23)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 72));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v43 = (uint64_t)v32;
            v44 = 2112;
            v45 = v33;
            v46 = 2112;
            v47 = v23;
            _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, encountered error fetching expired %@s, error, %@", buf, 0x20u);

            v15 = v35;
          }

          objc_msgSend(*(id *)(a1 + 56), "addObject:", v23);
        }
        else if (objc_msgSend(v22, "count"))
        {
          v25 = v13;
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = objc_msgSend(v22, "count");
            objc_msgSend(v17, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v43 = v27;
            v44 = 2112;
            v45 = v28;
            _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "adding %lu object IDs of type %@ to redaction map", buf, 0x16u);

          }
          v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v30, v31);

          v13 = v25;
          v14 = v34;
          v15 = v35;
        }

        ++v16;
      }
      while (v36 != v16);
      v36 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v36);
  }

}

- (BOOL)removeRecordsOwnedByOtherDevicesExpiredBeforeDate:(id)a3 allowPropagation:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  RTPersistenceExpirationEnforcer *v33;
  id v34;
  id v35;
  SEL v36;
  BOOL v37;
  uint8_t buf[8];
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = v12;
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_12;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
    }

    v19 = CFSTR("referenceDate");
    goto LABEL_19;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v19 = CFSTR("context");
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v19);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v14 = -[RTPersistenceManager mirroringDelegateStateForStoreType:](self->_persistenceManager, "mirroringDelegateStateForStoreType:", 1);
  if (v14 == 2)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("The mirroring request failed because the mirroring delegate failed setup.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceMirroringManagerErrorDomain"), 7, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_retainAutorelease(v24);
    *a6 = v25;

LABEL_12:
    v16 = 0;
    goto LABEL_20;
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke;
    v31[3] = &unk_1E929F130;
    v32 = v13;
    v33 = self;
    v35 = v26;
    v36 = a2;
    v34 = v11;
    v37 = a4;
    v27 = v26;
    objc_msgSend(v32, "performBlockAndWait:", v31);
    _RTSafeArray();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutorelease(v29);
    *a6 = v30;
    v16 = v30 == 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Attempted to remove records from other device with RTPersistenceMirroringDelegateStateUnknown", buf, 2u);
    }

    *a6 = 0;
    v16 = 1;
  }
LABEL_20:

  return v16;
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  dispatch_time_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  char v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *dsema;
  void *v71;
  int8x16_t v72;
  int8x16_t v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  NSObject *v81;
  _BYTE *v82;
  _QWORD v83[4];
  int8x16_t v84;
  id v85;
  _BYTE *v86;
  _QWORD v87[4];
  int8x16_t v88;
  id v89;
  _BYTE *v90;
  id v91;
  _BYTE v92[12];
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  _BYTE v97[24];
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _BYTE v101[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _BYTE buf[24];
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _QWORD v109[4];

  v109[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "setTransactionAuthor:", CFSTR("ExpirationEnforcer"));
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *v2;
  v91 = 0;
  objc_msgSend(v4, "collectRecordIDsByTypeExpiredBeforeDate:ownedByThisDevice:context:error:", v5, 0, v6, &v91);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v91;
  if (!v8)
  {
    v75 = v3;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v106 = __Block_byref_object_copy__91;
    v107 = __Block_byref_object_dispose__91;
    v108 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_39;
    v87[3] = &unk_1E92A0580;
    v72 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v72.i64[0];
    v88 = vextq_s8(v72, v72, 8uLL);
    v90 = buf;
    v13 = v10;
    v89 = v13;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v87);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v101 = 138412546;
        *(_QWORD *)&v101[4] = v50;
        *(_WORD *)&v101[12] = 2112;
        *(_QWORD *)&v101[14] = v51;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting matched lifetime records from other devices, error, %@", v101, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      goto LABEL_33;
    }
    *(_QWORD *)v101 = 0;
    *(_QWORD *)&v101[8] = v101;
    *(_QWORD *)&v101[16] = 0x3032000000;
    v102 = __Block_byref_object_copy__91;
    v103 = __Block_byref_object_dispose__91;
    v104 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v11;
    v83[1] = 3221225472;
    v83[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_41;
    v83[3] = &unk_1E92A0580;
    v73 = *(int8x16_t *)(a1 + 32);
    v16 = (id)v73.i64[0];
    v84 = vextq_s8(v73, v73, 8uLL);
    v86 = v101;
    v17 = v15;
    v85 = v17;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v83);
    if (*(_QWORD *)(*(_QWORD *)&v101[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *(_QWORD *)(*(_QWORD *)&v101[8] + 40);
        *(_DWORD *)v97 = 138412546;
        *(_QWORD *)&v97[4] = v54;
        *(_WORD *)&v97[12] = 2112;
        *(_QWORD *)&v97[14] = v55;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, encountered error while finding object IDs affected by deleting object, from other devices, error, %@", v97, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)&v101[8] + 40));
      goto LABEL_32;
    }
    if (*(_BYTE *)(a1 + 72) || !objc_msgSend(v7, "count"))
    {
LABEL_14:
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v76 = 0;
      objc_msgSend(v19, "removeExpiredRecordsWithObjectIDs:context:error:", v7, v20, &v76);
      v21 = v76;
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v97 = 138412546;
          *(_QWORD *)&v97[4] = v62;
          *(_WORD *)&v97[12] = 2112;
          *(_QWORD *)&v97[14] = v21;
          _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired records for other devices on this device, error, %@", v97, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v21);
      }
      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v97 = 138412290;
          *(_QWORD *)&v97[4] = v49;
          _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%@, successfully removed expired records from other devices on this device", v97, 0xCu);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", v75);

      goto LABEL_32;
    }
    *(_QWORD *)v97 = 0;
    *(_QWORD *)&v97[8] = v97;
    *(_QWORD *)&v97[16] = 0x3032000000;
    v98 = __Block_byref_object_copy__91;
    v99 = __Block_byref_object_dispose__91;
    v100 = 0;
    v25 = dispatch_semaphore_create(0);
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = objc_msgSend(v17, "count");
      *(_DWORD *)v92 = 134217984;
      *(_QWORD *)&v92[4] = v27;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "submitting reset metadata request for %lu entity types", v92, 0xCu);
    }

    v28 = objc_alloc(MEMORY[0x1E0C97B08]);
    v80[0] = v11;
    v80[1] = 3221225472;
    v80[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_43;
    v80[3] = &unk_1E92A05A8;
    v82 = v97;
    v29 = v25;
    v81 = v29;
    v30 = (void *)objc_msgSend(v28, "initWithOptions:completionBlock:", 0, v80);
    v78[0] = v11;
    v78[1] = 3221225472;
    v78[2] = __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_45;
    v78[3] = &unk_1E92A05D0;
    v31 = (id)objc_opt_new();
    v79 = v31;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v78);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObjectIDsToReset:", v32);
    v68 = v31;
    v71 = v30;

    v33 = *(void **)(a1 + 32);
    v77 = 0;
    objc_msgSend(v33, "executeRequest:error:", v30, &v77);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v77;
    v35 = v34;
    v69 = v34;
    if (!v74 || v34)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v92 = 138412802;
        *(_QWORD *)&v92[4] = v63;
        v93 = 2112;
        v94 = (uint64_t)v68;
        v95 = 2112;
        v96 = v35;
        _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "%@, encountered error during metadata reset request with object IDs %@s, error, %@", v92, 0x20u);

      }
      if (v35)
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v69);
      v53 = 0;
    }
    else
    {
      dsema = v29;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v36))
        goto LABEL_40;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceDate:", v67);
      v39 = v38;
      v40 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_72);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "filteredArrayUsingPredicate:", v66);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "submitToCoreAnalytics:type:duration:", v43, 1, v39);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v92 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v92, 2u);
      }

      v45 = (void *)MEMORY[0x1E0CB35C8];
      v109[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v92 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v109, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v48 = objc_retainAutorelease(v47);

      }
      else
      {
LABEL_40:
        v48 = 0;
      }

      v53 = v48;
      v56 = *(_QWORD *)(*(_QWORD *)&v97[8] + 40);
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (!v56)
      {
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v60 = (id)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v68, "count");
          *(_DWORD *)v92 = 138412802;
          *(_QWORD *)&v92[4] = v60;
          v93 = 2048;
          v94 = v61;
          v95 = 2112;
          v96 = v68;
          _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, successfully submitted metadata reset request for %lu object IDs, %@", v92, 0x20u);

        }
        v59 = 1;
LABEL_46:

        _Block_object_dispose(v97, 8);
        if ((v59 & 1) == 0)
        {
LABEL_32:

          _Block_object_dispose(v101, 8);
LABEL_33:

          v3 = v75;
          v8 = 0;

          _Block_object_dispose(buf, 8);
          goto LABEL_34;
        }
        goto LABEL_14;
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = *(void **)(*(_QWORD *)&v97[8] + 40);
        *(_DWORD *)v92 = 138412802;
        *(_QWORD *)&v92[4] = v64;
        v93 = 2112;
        v94 = (uint64_t)v68;
        v95 = 2112;
        v96 = v65;
        _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "%@, encountered error during metadata reset request with object IDs %@s, error, %@", v92, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)&v97[8] + 40));
    }
    v59 = 0;
    goto LABEL_46;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting expired records from other devices, error, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
LABEL_34:

}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_39(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1D8231EA8]();
        v15 = *(void **)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v17 + 40);
        objc_msgSend(v15, "objectsWithLifetimeMatchingObjectWithID:context:error:", v13, v16, &obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v17 + 40), obj);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          *a4 = 1;

          objc_autoreleasePoolPop(v14);
          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 32), "mergeEntriesFromDictionary:intoDictionary:", v18, *(_QWORD *)(a1 + 48));

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_41(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_msgSend(a3, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = *(void **)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v14 + 40);
        objc_msgSend(v12, "objectIDsByTypeAffectedByDeletingObjectWithID:context:error:", v11, v13, &obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v14 + 40), obj);
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 32), "mergeEntriesFromDictionary:intoDictionary:", v15, *(_QWORD *)(a1 + 48));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "madeChanges");
    v9 = objc_msgSend(v3, "success");
    objc_msgSend(v3, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v7;
    v16 = 1024;
    v17 = v8;
    v18 = 1024;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "result for metadata reset request, CD request identifier, %@, made changes, %d, success, %d, error, %@", (uint8_t *)&v14, 0x22u);

  }
  objc_msgSend(v3, "error");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __116__RTPersistenceExpirationEnforcer_removeRecordsOwnedByOtherDevicesExpiredBeforeDate_allowPropagation_context_error___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

}

- (id)objectsWithLifetimeMatchingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  RTPersistenceExpirationEnforcer *v23;
  id v24;
  uint8_t *v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        v11 = (void *)objc_opt_new();
        *(_QWORD *)buf = 0;
        v27 = buf;
        v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__91;
        v30 = __Block_byref_object_dispose__91;
        v31 = 0;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __89__RTPersistenceExpirationEnforcer_objectsWithLifetimeMatchingObjectWithID_context_error___block_invoke;
        v20[3] = &unk_1E929BF00;
        v21 = v10;
        v25 = buf;
        v22 = v8;
        v23 = self;
        v12 = v11;
        v24 = v12;
        objc_msgSend(v21, "performBlockAndWait:", v20);
        *a5 = objc_retainAutorelease(*((id *)v27 + 5));
        v13 = v24;
        v14 = v12;

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v17 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectID", buf, 2u);
      }

      v17 = CFSTR("objectID");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v17);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v14 = 0;
LABEL_15:

  return v14;
}

void __89__RTPersistenceExpirationEnforcer_objectsWithLifetimeMatchingObjectWithID_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _QWORD v65[4];
  _QWORD v66[4];
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v64 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v64;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v48 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v69 = v48;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unable to return an object for ID, %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      goto LABEL_35;
    }
    v17 = *(void **)(a1 + 40);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = v17;
    v70 = 2112;
    v71 = v19;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "object with ID, %@, is not of type RTCloudManagedObject, is %@", buf, 0x16u);
LABEL_14:

    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    objc_msgSend(v4, "inbound");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[NSObject addObject:](v9, "addObject:", v11);
    objc_msgSend(v4, "outbound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[NSObject addObject:](v9, "addObject:", v13);
    v14 = *(void **)(a1 + 48);
    +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mergeIdentifiersFromArray:entityName:intoDictionary:", v9, v16, *(_QWORD *)(a1 + 56));

    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    objc_msgSend(v4, "mapItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectID");
    v22 = objc_claimAutoreleasedReturnValue();

    if (v22)
      -[NSObject addObject:](v20, "addObject:", v22);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    objc_msgSend(v4, "mapItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "address");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectID");
    v26 = objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(v23, "addObject:", v26);
    v57 = v20;
    v58 = v23;
    v27 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v4, "visits");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

    v59 = v4;
    objc_msgSend(v4, "objectIDsForRelationshipNamed:", CFSTR("visits"));
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v29, "addObjectsFromArray:", v30);
    v53 = (void *)v30;
    v55 = (void *)v26;
    v56 = (void *)v22;
    v54 = v29;
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2 * objc_msgSend(v29, "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v59, "visits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v61 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v37, "inbound");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            objc_msgSend(v31, "addObject:", v39);
          objc_msgSend(v37, "outbound");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v31, "addObject:", v41);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      }
      while (v34);
    }

    +[RTMapItemMO entity](RTMapItemMO, "entity");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "name");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v51;
    v9 = v57;
    v66[0] = v57;
    +[RTAddressMO entity](RTAddressMO, "entity");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "name");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v49;
    v66[1] = v58;
    +[RTLearnedVisitMO entity](RTLearnedVisitMO, "entity");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v65[2] = v43;
    v66[2] = v54;
    +[RTLearnedTransitionMO entity](RTLearnedTransitionMO, "entity");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "name");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v65[3] = v45;
    v66[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "mergeEntriesFromDictionary:intoDictionary:", v46, *(_QWORD *)(a1 + 56));
    v4 = v59;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v9 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
              goto LABEL_34;
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v69 = v19;
            _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "Unhandled entity type, %@", buf, 0xCu);
            goto LABEL_14;
          }
        }
      }
    }
  }
LABEL_35:

}

- (id)objectIDsByTypeAffectedByDeletingObjectWithID:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  RTPersistenceExpirationEnforcer *v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        *(_QWORD *)buf = 0;
        v26 = buf;
        v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__91;
        v29 = __Block_byref_object_dispose__91;
        v30 = 0;
        v11 = (void *)objc_opt_new();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke;
        v19[3] = &unk_1E929BF00;
        v20 = v10;
        v21 = v8;
        v24 = buf;
        v12 = v11;
        v22 = v12;
        v23 = self;
        objc_msgSend(v20, "performBlockAndWait:", v19);
        *a5 = objc_retainAutorelease(*((id *)v26 + 5));
        v13 = v12;

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v16 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: objectID", buf, 2u);
      }

      v16 = CFSTR("objectID");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v13 = 0;
LABEL_15:

  return v13;
}

void __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  int8x16_t v21;
  _QWORD v22[4];
  id v23;
  int8x16_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v25 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unable to return an object for ID, %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = v5;
    v9 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v9 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v4, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithObjects:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v13, v9);
      objc_msgSend(v4, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "relationshipsByName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke_55;
      v22[3] = &unk_1E92A05F8;
      v23 = v4;
      v21 = *(int8x16_t *)(a1 + 48);
      v16 = (id)v21.i64[0];
      v24 = vextq_s8(v21, v21, 8uLL);
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 40);
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v18;
        v28 = 2112;
        v29 = v20;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "object with ID, %@, is not of type RTCloudManagedObject, is %@", buf, 0x16u);

      }
    }
  }

}

void __95__RTPersistenceExpirationEnforcer_objectIDsByTypeAffectedByDeletingObjectWithID_context_error___block_invoke_55(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "objectIDsForRelationshipNamed:", a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)a1[5];
  objc_msgSend(v6, "destinationEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mergeIdentifiersFromArray:entityName:intoDictionary:", v10, v9, a1[6]);

}

- (void)mergeIdentifiersFromArray:(id)a3 entityName:(id)a4 intoDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "mutableCopy");

  if (v11)
  {
    objc_msgSend(v11, "addObjectsFromArray:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "setObject:forKey:", v11, v8);
}

- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__RTPersistenceExpirationEnforcer_mergeEntriesFromDictionary_intoDictionary___block_invoke;
  v8[3] = &unk_1E92A0620;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __77__RTPersistenceExpirationEnforcer_mergeEntriesFromDictionary_intoDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeIdentifiersFromArray:entityName:intoDictionary:", v7, v6, *(_QWORD *)(a1 + 40));

}

- (BOOL)removeRecordsOwnedByThisDeviceExpiredBeforeDate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a5)
  {
    if (v9)
    {
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __97__RTPersistenceExpirationEnforcer_removeRecordsOwnedByThisDeviceExpiredBeforeDate_context_error___block_invoke;
        v23[3] = &unk_1E92978E8;
        v23[4] = self;
        v24 = v9;
        v26 = v12;
        v27 = a2;
        v25 = v11;
        v13 = v12;
        objc_msgSend(v25, "performBlockAndWait:", v23);
        _RTSafeArray();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_retainAutorelease(v15);
        *a5 = v16;
        v17 = v16 == 0;

        goto LABEL_15;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v20 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      v20 = CFSTR("referenceDate");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v20);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v17 = 0;
LABEL_15:

  return v17;
}

void __97__RTPersistenceExpirationEnforcer_removeRecordsOwnedByThisDeviceExpiredBeforeDate_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  objc_msgSend(v2, "collectRecordIDsByTypeExpiredBeforeDate:ownedByThisDevice:context:error:", v3, 1, v4, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, encountered error while collecting expired records from this device, error, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v16 = 0;
    objc_msgSend(v8, "removeExpiredRecordsWithObjectIDs:context:error:", v5, v9, &v16);
    v10 = v16;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = v10;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired records from this device, error, %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, successfully removed expired records from this device", buf, 0xCu);

      }
    }

  }
}

- (BOOL)removeExpiredRecordsWithObjectIDs:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  SEL v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke;
      v20[3] = &unk_1E9298238;
      v21 = v10;
      v23 = v11;
      v24 = a2;
      v22 = v8;
      v12 = v11;
      objc_msgSend(v21, "performBlockAndWait:", v20);
      _RTSafeArray();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_retainAutorelease(v14);
      *a5 = v15;
      v16 = v15 == 0;

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

void __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", CFSTR("ExpirationEnforcer"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke_2;
  v6[3] = &unk_1E92A0648;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v8 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setTransactionAuthor:", v5);

}

void __83__RTPersistenceExpirationEnforcer_removeExpiredRecordsWithObjectIDs_context_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (objc_class *)MEMORY[0x1E0C97A90];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithObjectIDs:", v9);
  objc_msgSend(v10, "setResultType:", 2);
  v11 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v11, "executeRequest:error:", v10, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v18;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, encountered error while removing expired %@s, error, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "result");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, successfully deleted %@ expired %@s", buf, 0x20u);

    }
  }

}

- (BOOL)removeExpiredRecordsBeforeDate:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a5)
  {
    if (v9)
    {
      if (v10)
      {
        v33 = 0;
        v12 = -[RTPersistenceExpirationEnforcer repairInvalidExpirationDatesWithContext:error:](self, "repairInvalidExpirationDatesWithContext:error:", v10, &v33);
        v13 = v33;
        v32 = 0;
        v14 = -[RTPersistenceExpirationEnforcer removeRecordsOwnedByThisDeviceExpiredBeforeDate:context:error:](self, "removeRecordsOwnedByThisDeviceExpiredBeforeDate:context:error:", v9, v11, &v32);
        v15 = v32;
        v31 = 0;
        v16 = -[RTPersistenceExpirationEnforcer removeRecordsOwnedByOtherDevicesExpiredBeforeDate:allowPropagation:context:error:](self, "removeRecordsOwnedByOtherDevicesExpiredBeforeDate:allowPropagation:context:error:", v9, 0, v11, &v31);
        v17 = v31;
        v18 = v17;
        if (!v12 || v13 || !v16 || !v14 || v15 || v17)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v20;
            v21 = "%@, failed";
            goto LABEL_20;
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v20;
            v21 = "%@, successful";
LABEL_20:
            _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);

          }
        }

        _RTSafeArray();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_retainAutorelease(v27);
        *a5 = v28;
        v23 = v28 == 0;

        goto LABEL_26;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      v25 = CFSTR("context");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", buf, 2u);
      }

      v25 = CFSTR("referenceDate");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v23 = 0;
LABEL_26:

  return v23;
}

- (BOOL)repairInvalidExpirationDatesWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  SEL v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v8 = (void *)objc_opt_new();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __81__RTPersistenceExpirationEnforcer_repairInvalidExpirationDatesWithContext_error___block_invoke;
      v17[3] = &unk_1E9297BC8;
      v19 = v8;
      v20 = a2;
      v18 = v7;
      v9 = v8;
      objc_msgSend(v18, "performBlockAndWait:", v17);
      _RTSafeArray();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_retainAutorelease(v11);
      *a4 = v12;
      v13 = v12 == 0;

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v13 = 0;
  }

  return v13;
}

void __81__RTPersistenceExpirationEnforcer_repairInvalidExpirationDatesWithContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K != nil"), CFSTR("propertiesByName"), CFSTR("expirationDate"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  v36 = (void *)v5;
  v37 = v4;
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v38 = v3;
  objc_msgSend(v3, "entitiesForConfiguration:", CFSTR("Cloud"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v6;
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v15, "propertiesByName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", CFSTR("expirationDate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "attributeType") != 900)
          objc_msgSend(v9, "removeObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 4838400.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  v19 = 0x1E0CB3000uLL;
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v44 != v21)
          objc_enumerationMutation(obj);
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AB0]), "initWithEntity:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
        objc_msgSend(*(id *)(v19 + 2176), "predicateWithFormat:", CFSTR("%K == nil || %K == %@"), CFSTR("expirationDate"), CFSTR("expirationDate"), v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPredicate:", v24);

        v57 = CFSTR("expirationDate");
        v58 = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setPropertiesToUpdate:", v25);

        objc_msgSend(v23, "setResultType:", 1);
        v26 = *(void **)(a1 + 32);
        v42 = 0;
        objc_msgSend(v26, "executeRequest:error:", v23, &v42);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v42;
        if (v28)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v52 = v34;
            v53 = 2112;
            v54 = (uint64_t)v28;
            _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, encountered error updating expiration dates that were invalid, error, %@", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v28);
        }
        else
        {
          objc_msgSend(v27, "result");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "count");
            *(_DWORD *)buf = 138412802;
            v52 = v32;
            v53 = 2048;
            v54 = v33;
            v55 = 2112;
            v56 = v30;
            _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%@, updated %lu expiration dates, object IDs, %@", buf, 0x20u);

            v19 = 0x1E0CB3000;
          }

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v20);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

@end
