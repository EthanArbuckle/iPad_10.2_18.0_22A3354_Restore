@implementation RTLearnedTransitionMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("RTLearnedTransitionMO"));
}

+ (id)managedObjectWithTransition:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)objc_msgSend(a1, "managedObjectWithTransition:managedObject:inManagedObjectContext:", a3, 0, a4);
}

+ (id)managedObjectWithTransition:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t *v23;
  SEL v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: transition";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_16;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v17 = "Invalid parameter not satisfying: [managedObject isKindOfClass:[RTLearnedTransitionMO class]]";
        goto LABEL_16;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  objc_msgSend(v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "allowTombstones") & 1) != 0 || (objc_msgSend(v9, "flags") & 1) == 0)
    {

      goto LABEL_9;
    }

LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
LABEL_9:
  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__141;
  v29 = __Block_byref_object_dispose__141;
  v30 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__RTLearnedTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke;
  v19[3] = &unk_1E92984D8;
  v23 = buf;
  v24 = a2;
  v20 = v8;
  v21 = v9;
  v22 = v11;
  objc_msgSend(v22, "performBlockAndWait:", v19);
  v15 = *((id *)v26 + 5);

  _Block_object_dispose(buf, 8);
LABEL_19:

  return v15;
}

void __90__RTLearnedTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  RTLearnedTransitionMO *v18;
  RTLearnedTransitionMO *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id v32;
  id v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  NSObject *v39;
  __int16 v40;
  NSObject *v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "visitIdentifierOrigin");
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(*(id *)(a1 + 32), "visitIdentifierOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v3, "setPredicate:", v6);

    -[NSObject setReturnsObjectsAsFaults:](v3, "setReturnsObjectsAsFaults:", 1);
    -[NSObject setFetchLimit:](v3, "setFetchLimit:", 1);
    v33 = 0;
    -[NSObject execute:](v3, "execute:", &v33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v33;
    objc_msgSend(v7, "firstObject");
    v2 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v10 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v10;
        v36 = 2112;
        v37 = v3;
        v38 = 2112;
        v39 = v8;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error performing fetch, %@, error, %@", buf, 0x20u);

      }
      goto LABEL_14;
    }
    if (!v2)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        v36 = 2112;
        v37 = v3;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, no results returned for fetch of transition origin, %@", buf, 0x16u);

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "visitIdentifierDestination");
  v3 = objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_25;
  +[RTLearnedVisitMO fetchRequest](RTLearnedVisitMO, "fetchRequest");
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "visitIdentifierDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setPredicate:](v8, "setPredicate:", v15);

  -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 1);
  -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
  v32 = 0;
  -[NSObject execute:](v8, "execute:", &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;
  objc_msgSend(v16, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
LABEL_26:

      goto LABEL_27;
    }
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v28 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v35 = v28;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v29 = "%@, encountered error performing fetch, %@, error, %@";
    v30 = v17;
    v31 = 32;
LABEL_30:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

    goto LABEL_13;
  }
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v27 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v27;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, no results returned for fetch of transition destination, %@", buf, 0x16u);

    }
    v3 = 0;
    goto LABEL_25;
  }

  if (!v2)
  {
LABEL_25:
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "visitIdentifierOrigin");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "visitIdentifierDestination");
    v28 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = v9;
    v36 = 2112;
    v37 = v17;
    v38 = 2112;
    v39 = v2;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v3;
    v29 = "%@, attempting to create a transition with nonexistent endpoints. origin, identifier, %@, visit, %@, destinati"
          "on, identifier, %@, visit, %@";
    v30 = v8;
    v31 = 52;
    goto LABEL_30;
  }
  v18 = *(RTLearnedTransitionMO **)(a1 + 40);
  v19 = v18;
  if (!v18)
    v19 = -[RTLearnedTransitionMO initWithContext:]([RTLearnedTransitionMO alloc], "initWithContext:", *(_QWORD *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v19);
  if (!v18)

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIdentifier:", v20);

  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStartDate:", v21);

  objc_msgSend(*(id *)(a1 + 32), "stopDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStopDate:", v22);

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCreationDate:", v23);

  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setExpirationDate:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "predominantMotionActivityType"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPredominantMotionActivityType:", v25);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setOrigin:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDestination:", v3);
LABEL_27:

}

@end
