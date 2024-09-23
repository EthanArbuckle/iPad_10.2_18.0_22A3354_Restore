@implementation SMSessionMonitorStateMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMSessionMonitorStateMO"));
}

+ (id)initWithSessionMonitorState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  __int16 v19;
  __int16 v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v14 = 0;
      goto LABEL_8;
    }
    v20 = 0;
    v16 = "Invalid parameter not satisfying: state";
    v17 = (uint8_t *)&v20;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v19 = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    v17 = (uint8_t *)&v19;
    goto LABEL_10;
  }
  objc_msgSend(v6, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "currentRegionState");
  v11 = objc_msgSend(v6, "triggerPending");
  v12 = objc_msgSend(v6, "triggerConfirmed");
  objc_msgSend(v6, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectWithSessionIdentifier:currentRegionState:triggerPending:triggerConfirmed:date:managedObjectContext:", v9, v10, v11, v12, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7 managedObjectContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  unint64_t v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = v15;
  if (v15)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__113;
    v31 = __Block_byref_object_dispose__113;
    v32 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __139__SMSessionMonitorStateMO_managedObjectWithSessionIdentifier_currentRegionState_triggerPending_triggerConfirmed_date_managedObjectContext___block_invoke;
    v19[3] = &unk_1E92A2490;
    v23 = &v27;
    v20 = v15;
    v21 = v13;
    v22 = v14;
    v24 = a4;
    v25 = a5;
    v26 = a6;
    objc_msgSend(v20, "performBlockAndWait:", v19);
    v17 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __139__SMSessionMonitorStateMO_managedObjectWithSessionIdentifier_currentRegionState_triggerPending_triggerConfirmed_date_managedObjectContext___block_invoke(uint64_t a1)
{
  SMSessionMonitorStateMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[SMSessionMonitorStateMO initWithContext:]([SMSessionMonitorStateMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCurrentRegionState:", *(__int16 *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTriggerPending:", *(unsigned __int8 *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTriggerConfirmed:", *(unsigned __int8 *)(a1 + 73));
}

@end
