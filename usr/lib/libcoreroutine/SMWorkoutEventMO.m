@implementation SMWorkoutEventMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("SMWorkoutEventMO"));
}

+ (id)managedObjectWithSMWorkoutEvent:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithSMWorkoutEvent:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithSMWorkoutEvent:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v11 = 0;
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: workoutEvent";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_10;
  }
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__145;
  v24 = __Block_byref_object_dispose__145;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SMWorkoutEventMO_managedObjectWithSMWorkoutEvent_managedObject_inManagedObjectContext___block_invoke;
  v15[3] = &unk_1E92987D0;
  v19 = buf;
  v16 = v8;
  v17 = v10;
  v18 = v7;
  objc_msgSend(v17, "performBlockAndWait:", v15);
  v11 = *((id *)v21 + 5);

  _Block_object_dispose(buf, 8);
LABEL_8:

  return v11;
}

void __89__SMWorkoutEventMO_managedObjectWithSMWorkoutEvent_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  SMWorkoutEventMO *v2;
  SMWorkoutEventMO *v3;
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
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(SMWorkoutEventMO **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = -[SMWorkoutEventMO initWithContext:]([SMWorkoutEventMO alloc], "initWithContext:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 48), "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionIdentifier:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setActivityType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "activityType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocationType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "locationType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSwimmingLocationType:", (__int16)objc_msgSend(*(id *)(a1 + 48), "swimmingLocationType"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSessionState:", (__int16)objc_msgSend(*(id *)(a1 + 48), "sessionState"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsResumedSessionState:", objc_msgSend(*(id *)(a1 + 48), "isResumedSessionState"));
  objc_msgSend(*(id *)(a1 + 48), "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDate:", v6);

  +[SMLocationMO fetchRequest](SMLocationMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 48), "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  v12 = *(void **)(a1 + 40);
  v20 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v7, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "+[SMWorkoutEventMO managedObjectWithSMWorkoutEvent:managedObject:inManagedObjectContext:]_block_invoke";
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "SMWorkoutEventMO,%s,workoutEvent.location,%@,location fetch error,%@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMLocationMO managedObjectWithLocation:managedObject:inManagedObjectContext:](SMLocationMO, "managedObjectWithLocation:managedObject:inManagedObjectContext:", v16, v17, *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLocation:", v18);

}

+ (id)getWorkoutEventMOFromWorkoutEvents:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[SMWorkoutEventMO getWorkoutEventMOFromWorkoutEvent:context:](SMWorkoutEventMO, "getWorkoutEventMOFromWorkoutEvent:context:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)getWorkoutEventMOFromWorkoutEvent:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v5 = a4;
  v6 = a3;
  +[SMWorkoutEventMO fetchRequest](SMWorkoutEventMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  v15 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v7, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMWorkoutEventMO managedObjectWithSMWorkoutEvent:managedObject:inManagedObjectContext:](SMWorkoutEventMO, "managedObjectWithSMWorkoutEvent:managedObject:inManagedObjectContext:", v6, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
