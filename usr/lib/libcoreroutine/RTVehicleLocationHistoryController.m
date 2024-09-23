@implementation RTVehicleLocationHistoryController

- (RTVehicleLocationHistoryController)initWithQueue:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  RTVehicleLocationHistoryController *v9;
  RTVehicleLocationHistoryController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTVehicleLocationHistoryController;
  v9 = -[RTVehicleLocationHistoryController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
  }

  return v10;
}

- (BOOL)_evaluateUsualLocationWithVehicleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  objc_msgSend(v4, "nearbyLocationOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTVehicleLocationHistoryController _getAllVehicleEventsFromHistory](self, "_getAllVehicleEventsFromHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__22;
    v32 = __Block_byref_object_dispose__22;
    v33 = 0;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __77__RTVehicleLocationHistoryController__evaluateUsualLocationWithVehicleEvent___block_invoke;
    v25 = &unk_1E92996C0;
    v7 = v4;
    v26 = v7;
    v27 = &v28;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v22);
    if (v29[5])
    {
      objc_msgSend(v7, "location", v22, v23, v24, v25);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "latitude");
      objc_msgSend(v7, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "longitude");
      objc_msgSend((id)v29[5], "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "latitude");
      objc_msgSend((id)v29[5], "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "longitude");
      RTCommonCalculateDistance();
      v13 = v12;

      objc_msgSend(v7, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "horizontalUncertainty");
      v16 = v15;
      objc_msgSend((id)v29[5], "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "horizontalUncertainty");
      v19 = v16 + 20.0 + v18;

      v20 = 130.0;
      if (v19 <= 130.0)
        v20 = v19;
      LOBYTE(v5) = v13 < v20;
    }
    else
    {
      LOBYTE(v5) = 0;
    }

    _Block_object_dispose(&v28, 8);
  }

  return (char)v5;
}

void __77__RTVehicleLocationHistoryController__evaluateUsualLocationWithVehicleEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nearbyLocationOfInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latitude");
  objc_msgSend(*(id *)(a1 + 32), "nearbyLocationOfInterest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "longitude");
  objc_msgSend(v15, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latitude");
  objc_msgSend(v15, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "longitude");
  RTCommonCalculateDistance();
  v14 = v13;

  if (v14 < 250.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_persistVehicleEventToHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  RTVehicleLocationHistoryController *v17;
  uint8_t *v18;
  uint8_t v19[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "nearbyLocationOfInterest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "vehicle event is not close to any LOIs, not persisting to history.", v19, 2u);
    }
    goto LABEL_11;
  }
  -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "managedObjectContext is nil, not persisting vehicle event to history.", v19, 2u);
    }
LABEL_11:

    v9 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)v19 = 0;
  v20 = v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__22;
  v23 = __Block_byref_object_dispose__22;
  v24 = 0;
  -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__RTVehicleLocationHistoryController__persistVehicleEventToHistory___block_invoke;
  v15[3] = &unk_1E9297AD0;
  v16 = v4;
  v17 = self;
  v18 = v19;
  objc_msgSend(v7, "performBlockAndWait:", v15);

  v8 = *((_QWORD *)v20 + 5);
  v9 = v8 == 0;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      objc_msgSend(*((id *)v20 + 5), "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "Error persisting the vehicle event to history, %@", buf, 0xCu);

    }
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "Persisted a vehicle event to history.", buf, 2u);
  }

  _Block_object_dispose(v19, 8);
LABEL_15:

  return v9;
}

void __68__RTVehicleLocationHistoryController__persistVehicleEventToHistory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id obj;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RTVehicleEventHistoryMO managedObjectWithVehicleEvent:inManagedObjectContext:](RTVehicleEventHistoryMO, "managedObjectWithVehicleEvent:inManagedObjectContext:", v2, v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "save:", &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

}

- (id)_getAllVehicleEventsFromHistory
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_QWORD *)buf = 0;
    v16 = buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__22;
    v19 = __Block_byref_object_dispose__22;
    v20 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__22;
    v13 = __Block_byref_object_dispose__22;
    v14 = 0;
    -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke;
    v8[3] = &unk_1E9299710;
    v8[4] = self;
    v8[5] = buf;
    v8[6] = &v9;
    objc_msgSend(v4, "performBlockAndWait:", v8);

    v5 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(buf, 8);
    return v5;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "managedObjectContext is nil, not fetching from history.", buf, 2u);
    }

    return 0;
  }
}

void __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTVehicleEventHistoryMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v4, "fetchAllWithEntityName:predicate:sortDescriptors:error:", v5, 0, v3, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134218242;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Retrieved %lu vehicle events from history, error, %@.", buf, 0x16u);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v11 = objc_opt_new();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke_16;
    v14[3] = &unk_1E92996E8;
    v14[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  }

}

void __69__RTVehicleLocationHistoryController__getAllVehicleEventsFromHistory__block_invoke_16(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v3 = (objc_class *)MEMORY[0x1E0D183B0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "locLatitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v4, "locLongitude");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(v4, "locUncertainty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  objc_msgSend(v4, "locDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v5, "initWithLatitude:longitude:horizontalUncertainty:date:", v15, v8, v11, v14);

  v16 = objc_alloc(MEMORY[0x1E0D18570]);
  objc_msgSend(v4, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);
  LOBYTE(v22) = 1;
  v21 = (void *)objc_msgSend(v16, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v17, v23, 0, 0, 0, v20, 0, 0, v22);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v21);
}

- (BOOL)_deleteVehicleEventsBeforeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  RTVehicleLocationHistoryController *v15;
  uint8_t *v16;
  uint8_t v17[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)v17 = 0;
    v18 = v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__22;
    v21 = __Block_byref_object_dispose__22;
    v22 = 0;
    -[RTVehicleLocationHistoryController managedObjectContext](self, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__RTVehicleLocationHistoryController__deleteVehicleEventsBeforeDate___block_invoke;
    v13[3] = &unk_1E9297AD0;
    v14 = v4;
    v15 = self;
    v16 = v17;
    objc_msgSend(v6, "performBlockAndWait:", v13);

    v7 = *((_QWORD *)v18 + 5);
    v8 = v7 == 0;
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*((id *)v18 + 5), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Error deleting history parked event, %@", buf, 0xCu);

      }
    }

    _Block_object_dispose(v17, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "No managed object context, not deleting.", v17, 2u);
    }

    v8 = 0;
  }

  return v8;
}

void __69__RTVehicleLocationHistoryController__deleteVehicleEventsBeforeDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id obj;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(date <= %@)"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSManagedObject entityName](RTVehicleEventHistoryMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "deleteAllWithEntityName:predicate:error:", v4, v2, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(id *)(v7 + 40);
    objc_msgSend(v6, "save:", &v8);
    objc_storeStrong((id *)(v7 + 40), v8);

  }
}

+ (int64_t)periodicPurgePolicy
{
  return 2;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  RTVehicleLocationHistoryController *v15;
  id v16;
  int64_t v17;

  v8 = a4;
  v9 = a5;
  -[RTVehicleLocationHistoryController queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__RTVehicleLocationHistoryController_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __82__RTVehicleLocationHistoryController_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  if (*(_QWORD *)(a1 + 56) <= 2uLL && (v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "_deleteVehicleEventsBeforeDate:", v2);
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
