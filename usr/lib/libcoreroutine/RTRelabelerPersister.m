@implementation RTRelabelerPersister

- (RTRelabelerPersister)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedPlaceParameters_metrics_persistenceManager_relabelerParameters_reverseGeocodeProvider_);
}

- (RTRelabelerPersister)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedPlaceParameters:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 reverseGeocodeProvider:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RTRelabelerPersisterParameters *v22;
  void *v23;
  RTRelabelerPersister *v24;
  NSObject *v25;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (v15)
  {
    v22 = -[RTRelabelerPersisterParameters initWithDefaultsManager:]([RTRelabelerPersisterParameters alloc], "initWithDefaultsManager:", v15);
    v23 = (void *)objc_opt_new();
    self = -[RTRelabelerPersister initWithDistanceCalculator:learnedPlaceParameters:locationShifter:metrics:persistenceManager:relabelerParameters:relabelerPersisterParameters:reverseGeocodeProvider:](self, "initWithDistanceCalculator:learnedPlaceParameters:locationShifter:metrics:persistenceManager:relabelerParameters:relabelerPersisterParameters:reverseGeocodeProvider:", v16, v17, v23, v18, v19, v20, v22, v21);

    v24 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (RTRelabelerPersister)initWithDistanceCalculator:(id)a3 learnedPlaceParameters:(id)a4 locationShifter:(id)a5 metrics:(id)a6 persistenceManager:(id)a7 relabelerParameters:(id)a8 relabelerPersisterParameters:(id)a9 reverseGeocodeProvider:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  RTRelabelerPersister *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSManagedObjectContext *context;
  uint64_t v27;
  NSMutableDictionary *loiIdentifierToUnconcreteMap;
  NSObject *v29;
  RTRelabelerPersister *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v37;
  id obj;
  id v39;
  id v40;
  id v41;
  void *v43;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v39 = a4;
  v17 = a4;
  v40 = a5;
  v18 = a5;
  obj = a6;
  v19 = a6;
  v20 = a7;
  v44 = a8;
  v45 = a9;
  v21 = a10;
  v41 = v16;
  v43 = v21;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v30 = 0;
    v32 = 0;
    v22 = self;
    v23 = v20;
    goto LABEL_21;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    v22 = self;
    v23 = v20;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedPlaceParameters", buf, 2u);
    }

    v30 = 0;
    v32 = v41;
LABEL_21:
    v24 = v44;
    goto LABEL_36;
  }
  v22 = self;
  v23 = v20;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    v24 = v44;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: locationShifter";
LABEL_32:
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_33;
  }
  v24 = v44;
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: metrics";
    goto LABEL_32;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_32;
  }
  if (!v44)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: relabelerParameters";
    goto LABEL_32;
  }
  if (!v45)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "Invalid parameter not satisfying: relabelerPersisterParameters";
      goto LABEL_32;
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v21)
  {
    v46.receiver = self;
    v46.super_class = (Class)RTRelabelerPersister;
    v22 = -[RTRelabelerPersister init](&v46, sel_init);
    if (!v22)
    {
LABEL_14:
      v22 = v22;
      v30 = v22;
LABEL_35:
      v32 = v41;
      goto LABEL_36;
    }
    objc_msgSend(v23, "managedObjectContext");
    v25 = objc_claimAutoreleasedReturnValue();
    context = v22->_context;
    v22->_context = (NSManagedObjectContext *)v25;

    if (v22->_context)
    {
      objc_storeStrong((id *)&v22->_distanceCalculator, a3);
      objc_storeStrong((id *)&v22->_metrics, obj);
      objc_storeStrong((id *)&v22->_learnedPlaceParameters, v39);
      objc_storeStrong((id *)&v22->_locationShifter, v40);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = objc_claimAutoreleasedReturnValue();
      loiIdentifierToUnconcreteMap = v22->_loiIdentifierToUnconcreteMap;
      v22->_loiIdentifierToUnconcreteMap = (NSMutableDictionary *)v27;

      objc_storeStrong((id *)&v22->_relabelerParameters, a8);
      objc_storeStrong((id *)&v22->_relabelerPersisterParameters, a9);
      objc_storeStrong((id *)&v22->_reverseGeocodeProvider, a10);
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v17;
        v49 = 2112;
        v50 = v45;
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "created relabelerPersister with learnedPlaceParameters, %@, relabelerPersisterParameters, %@", buf, 0x16u);
      }

      goto LABEL_14;
    }
LABEL_34:
    v30 = 0;
    goto LABEL_35;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  v32 = v41;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reverseGeocodeProvider", buf, 2u);
  }

  v30 = 0;
LABEL_36:

  return v30;
}

+ (id)locationFromAggregateVisits:(id)a3
{
  id v3;
  _RTMap *v4;
  void *v5;
  RTLearnedLocation *v6;

  v3 = a3;
  v4 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v3);

  -[_RTMap withBlock:](v4, "withBlock:", &__block_literal_global_70);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[RTLearnedLocation initWithLearnedVisits:]([RTLearnedLocation alloc], "initWithLearnedVisits:", v5);
  return v6;
}

id __52__RTRelabelerPersister_locationFromAggregateVisits___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[RTLearnedVisit createWithManagedObject:](RTLearnedVisit, "createWithManagedObject:", a2);
}

- (BOOL)unconcreteLOIMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[8];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTRelabelerPersister loiIdentifierToUnconcreteMap](self, "loiIdentifierToUnconcreteMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[RTRelabelerPersister loiIdentifierToUnconcreteMap](self, "loiIdentifierToUnconcreteMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      objc_msgSend(v4, "visits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "count") != 0;

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v4, "visits", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "locationOfInterestSource");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedIntegerValue");

            if (v20)
            {
              v11 = 0;
              goto LABEL_17;
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v16)
            continue;
          break;
        }
      }
LABEL_17:

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTRelabelerPersister loiIdentifierToUnconcreteMap](self, "loiIdentifierToUnconcreteMap");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }

    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)fetchNearbyLocationOfInterestMOsAroundLocation:(id)a3 withinDistance:(double)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id *v64;
  void *v65;
  id v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  id obj;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  RTRelabelerPersister *v75;
  void *v76;
  void *context;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  _BYTE v85[128];
  void *v86;
  uint64_t v87;
  const __CFString *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (a5)
  {
    if (!v9)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v93 = *MEMORY[0x1E0CB2D50];
      v94[0] = CFSTR("requires a non-nil location");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v16;
        v91 = 2112;
        v92 = v14;
        goto LABEL_35;
      }
LABEL_10:

      v17 = objc_retainAutorelease(v14);
      v18 = 0;
      *a5 = v17;
      goto LABEL_33;
    }
    if (a4 < 0.0)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v87 = *MEMORY[0x1E0CB2D50];
      v88 = CFSTR("requries a non-negative distance");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v16;
        v91 = 2112;
        v92 = v14;
LABEL_35:
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), CFSTR("visits"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v17 = objc_claimAutoreleasedReturnValue();

    +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTRelabelerPersister locationShifter](self, "locationShifter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v25 = objc_msgSend(v23, "setupBoundingBoxFetchRequestForLocation:distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:", v10, 1, v24, 0, v17, &v84, a4);
    v26 = v84;

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v23, "setReturnsObjectsAsFaults:", 1);
      objc_msgSend(v23, "setFetchBatchSize:", 1);
      v83 = 0;
      objc_msgSend(v23, "execute:", &v83);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v83;
      v69 = v28;
      if (v28)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v28, "userInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v90 = v23;
          v91 = 2112;
          v92 = v31;
          _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "nearby fetch request, %@, error, %@", buf, 0x16u);
        }

        v33 = objc_retainAutorelease(v31);
        v18 = 0;
        *a5 = v33;
      }
      else
      {
        v75 = self;
        v66 = v26;
        v67 = v23;
        v68 = v17;
        v64 = a5;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v27, "count"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v65 = v27;
        obj = v27;
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v74)
        {
          v72 = *(_QWORD *)v80;
          v73 = v10;
LABEL_19:
          v34 = 0;
          while (1)
          {
            if (*(_QWORD *)v80 != v72)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v34);
            context = (void *)MEMORY[0x1D8231EA8]();
            v36 = objc_alloc(MEMORY[0x1E0D183B0]);
            objc_msgSend(v35, "locationLatitude");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "doubleValue");
            v38 = v37;
            objc_msgSend(v35, "locationLongitude");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;
            objc_msgSend(v35, "locationHorizontalUncertainty");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "doubleValue");
            v44 = v43;
            objc_msgSend(v35, "locationAltitude");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = v46;
            objc_msgSend(v35, "locationVerticalUncertainty");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "doubleValue");
            v50 = v49;
            objc_msgSend(v35, "locationReferenceFrame");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "intValue");
            objc_msgSend(v35, "locationSourceAccuracy");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(v36, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v52, (int)objc_msgSend(v53, "intValue"), v38, v41, v44, v47, v50, 0.0);

            -[RTRelabelerPersister distanceCalculator](v75, "distanceCalculator");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = 0;
            v10 = v73;
            objc_msgSend(v55, "distanceFromLocation:toLocation:error:", v54, v73, &v78);
            v57 = v56;
            v58 = v78;

            if (v58)
              break;
            if (v57 <= a4)
              objc_msgSend(v70, "addObject:", v35);

            objc_autoreleasePoolPop(context);
            if (v74 == ++v34)
            {
              v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
              if (v74)
                goto LABEL_19;
              goto LABEL_27;
            }
          }
          v59 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v58, "userInfo");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 1, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(context);
          if (!v61)
            goto LABEL_30;
          v62 = objc_retainAutorelease(v61);
          *v64 = v62;

          v18 = 0;
          v23 = v67;
          v17 = v68;
          v27 = v65;
          v26 = v66;
          v33 = v70;
        }
        else
        {
LABEL_27:

LABEL_30:
          v33 = v70;
          v18 = v33;
          v23 = v67;
          v17 = v68;
          v27 = v65;
          v26 = v66;
        }
      }

    }
    else
    {
      v18 = 0;
      *a5 = objc_retainAutorelease(v26);
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
    v18 = 0;
  }
LABEL_33:

  return v18;
}

- (id)fetchClosestUnconcreteLocationOfInterestMOToLocation:(id)a3 withinDistance:(double)a4 distanceCalculator:(id)a5 error:(id *)a6
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v62;
  void *v63;
  id *v64;
  void *v65;
  const char *aSelector;
  uint64_t v67;
  RTRelabelerPersister *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id obj;
  double v73;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  uint64_t v90;
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v73 = COERCE_DOUBLE(a3);
  v11 = a5;
  v12 = v11;
  if (a6)
  {
    aSelector = a2;
    if (v11)
    {
      v80 = 0;
      -[RTRelabelerPersister fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:](self, "fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:", *(_QWORD *)&v73, &v80, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v80;
      v15 = v14;
      if (v14)
      {
        v16 = 0;
        *a6 = objc_retainAutorelease(v14);
      }
      else
      {
        v65 = v13;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        obj = v13;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        if (v23)
        {
          v24 = v23;
          v64 = a6;
          v71 = 0;
          v25 = *(_QWORD *)v77;
          v26 = 1.79769313e308;
          v68 = self;
          v69 = v12;
          v67 = *(_QWORD *)v77;
          while (2)
          {
            v27 = 0;
            v70 = v24;
            do
            {
              if (*(_QWORD *)v77 != v25)
                objc_enumerationMutation(obj);
              v28 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v27);
              if (-[RTRelabelerPersister unconcreteLOIMO:](self, "unconcreteLOIMO:", v28))
              {
                v29 = objc_alloc(MEMORY[0x1E0D183B0]);
                objc_msgSend(v28, "locationLatitude");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "doubleValue");
                v31 = v30;
                objc_msgSend(v28, "locationLongitude");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "doubleValue");
                v34 = v33;
                objc_msgSend(v28, "locationHorizontalUncertainty");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "doubleValue");
                v37 = v36;
                objc_msgSend(v28, "locationAltitude");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "doubleValue");
                v40 = v39;
                objc_msgSend(v28, "locationVerticalUncertainty");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "doubleValue");
                v43 = v42;
                objc_msgSend(v28, "locationReferenceFrame");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "intValue");
                objc_msgSend(v28, "locationSourceAccuracy");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = (void *)objc_msgSend(v29, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v45, (int)objc_msgSend(v46, "intValue"), v31, v34, v37, v40, v43, 0.0);

                v12 = v69;
                v75 = 0;
                objc_msgSend(v69, "distanceFromLocation:toLocation:error:", v47, *(_QWORD *)&v73, &v75);
                v49 = v48;
                v50 = v75;
                if (v50)
                {
                  v52 = v50;
                  v53 = (void *)MEMORY[0x1E0CB35C8];
                  objc_msgSend(v50, "userInfo");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 1, v54);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v82 = v63;
                    v83 = 2112;
                    v84 = *(double *)&v47;
                    v85 = 2112;
                    v86 = v73;
                    v87 = 2112;
                    v88 = v55;
                    _os_log_error_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_ERROR, "%@, distance from location %@, to location %@, error, %@", buf, 0x2Au);

                  }
                  v57 = objc_retainAutorelease(v55);
                  *v64 = v57;

                  v16 = 0;
                  v13 = v65;
                  v15 = 0;
                  v58 = v71;
                  goto LABEL_31;
                }
                if (v49 < v26)
                {
                  v51 = v28;

                  v71 = v51;
                  v26 = v49;
                }
                v25 = v67;
                self = v68;
                v24 = v70;

              }
              ++v27;
            }
            while (v24 != v27);
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            if (v24)
              continue;
            break;
          }
        }
        else
        {
          v71 = 0;
        }

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v71, "identifier");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v82 = v60;
          v83 = 2112;
          v84 = v73;
          v85 = 2048;
          v86 = a4;
          _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "fetched closest unconcrete, identifier, %@, location, %@, distance, %.3f", buf, 0x20u);

        }
        v58 = v71;
        v16 = v58;
        v13 = v65;
        v15 = 0;
LABEL_31:

      }
    }
    else
    {
      v17 = a6;
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D18598];
      v90 = *MEMORY[0x1E0CB2D50];
      v91[0] = CFSTR("requires a non-nil distance calculator");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v82 = v62;
        v83 = 2112;
        v84 = *(double *)&v21;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v15 = objc_retainAutorelease(v21);
      v16 = 0;
      *v17 = v15;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (id)fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO:(id)a3 distanceCalculator:(id)a4 unusableIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  RTRelabelerPersister *v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  id v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  _RTMap *v86;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  id v95;
  void *v97;
  void *v98;
  const char *aSelector;
  id *v100;
  void *v101;
  id v102;
  NSObject *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  id obj;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  uint8_t buf[4];
  uint64_t v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  NSObject *v122;
  __int16 v123;
  void *v124;
  _BYTE v125[128];
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  const __CFString *v129;
  uint64_t v130;
  _QWORD v131[3];

  v131[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v37 = 0;
    goto LABEL_42;
  }
  if (!v10)
  {
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0D18598];
    v130 = *MEMORY[0x1E0CB2D50];
    v131[0] = CFSTR("requires a non-nil loiMO");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, &v130, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 7, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v118 = (uint64_t)v43;
    v119 = 2112;
    v120 = v41;
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v12)
  {
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0D18598];
    v128 = *MEMORY[0x1E0CB2D50];
    v129 = CFSTR("requires a non-nil unusable identifiers set");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 7, v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v118 = (uint64_t)v43;
    v119 = 2112;
    v120 = v41;
    goto LABEL_16;
  }
  if (!v11)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0D18598];
    v126 = *MEMORY[0x1E0CB2D50];
    v127 = CFSTR("requires a non-nil distance calculator");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 7, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v118 = (uint64_t)v43;
      v119 = 2112;
      v120 = v41;
      goto LABEL_16;
    }
LABEL_17:

    v33 = objc_retainAutorelease(v41);
    v37 = 0;
    *a6 = v33;
    goto LABEL_42;
  }
  aSelector = a2;
  v100 = a6;
  v104 = v12;
  v105 = v11;
  v14 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v10, "locationLatitude");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;
  objc_msgSend(v10, "locationLongitude");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;
  objc_msgSend(v10, "locationHorizontalUncertainty");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;
  objc_msgSend(v10, "locationAltitude");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v25;
  objc_msgSend(v10, "locationVerticalUncertainty");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  objc_msgSend(v10, "locationReferenceFrame");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "intValue");
  objc_msgSend(v10, "locationSourceAccuracy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v14, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v31, (int)objc_msgSend(v32, "intValue"), v17, v20, v23, v26, v29, 0.0);

  -[RTRelabelerPersister relabelerPersisterParameters](self, "relabelerPersisterParameters");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "unconcreteLOICollapseDistanceThreshold");
  v116 = 0;
  -[RTRelabelerPersister fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:](self, "fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:", v33, &v116);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v116;

  if (v36)
  {
    v37 = 0;
    *v100 = objc_retainAutorelease(v36);
    v13 = v104;
    v11 = v105;
  }
  else
  {
    v103 = v33;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v98 = v35;
    obj = v35;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
    v13 = v104;
    if (v50)
    {
      v51 = v50;
      v52 = self;
      v53 = *(_QWORD *)v113;
      v102 = v10;
      while (2)
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v113 != v53)
            objc_enumerationMutation(obj);
          v55 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
          objc_msgSend(v55, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v56, "isEqual:", v57);

          if ((v58 & 1) == 0)
          {
            objc_msgSend(v55, "identifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "member:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v60)
            {
              if (-[RTRelabelerPersister unconcreteLOIMO:](v52, "unconcreteLOIMO:", v55))
              {
                v106 = objc_alloc(MEMORY[0x1E0D183B0]);
                objc_msgSend(v55, "locationLatitude");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "doubleValue");
                v62 = v61;
                objc_msgSend(v55, "locationLongitude");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "doubleValue");
                v64 = v63;
                objc_msgSend(v55, "locationHorizontalUncertainty");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "doubleValue");
                v67 = v66;
                objc_msgSend(v55, "locationAltitude");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "doubleValue");
                v70 = v69;
                objc_msgSend(v55, "locationVerticalUncertainty");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "doubleValue");
                v73 = v72;
                objc_msgSend(v55, "locationReferenceFrame");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = objc_msgSend(v74, "intValue");
                objc_msgSend(v55, "locationSourceAccuracy");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = (void *)objc_msgSend(v106, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v75, (int)objc_msgSend(v76, "intValue"), v62, v64, v67, v70, v73, 0.0);

                v111 = 0;
                objc_msgSend(v105, "distanceFromLocation:toLocation:error:", v77, v103, &v111);
                v79 = v78;
                v80 = v111;
                if (v80)
                {
                  v90 = v80;
                  v91 = (void *)MEMORY[0x1E0CB35C8];
                  objc_msgSend(v80, "userInfo");
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 1, v92);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                  v94 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v118 = (uint64_t)v97;
                    v119 = 2112;
                    v120 = v77;
                    v121 = 2112;
                    v122 = v103;
                    v123 = 2112;
                    v124 = v93;
                    _os_log_error_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_ERROR, "%@, distance from location %@, to location %@, error, %@", buf, 0x2Au);

                  }
                  v95 = objc_retainAutorelease(v93);
                  *v100 = v95;

                  v37 = 0;
                  v85 = v101;
                  v10 = v102;
                  v13 = v104;
                  v11 = v105;
                  v36 = 0;
                  v35 = v98;
                  goto LABEL_40;
                }
                objc_msgSend(v77, "horizontalUncertainty");
                v82 = v79 - v81;
                -[NSObject horizontalUncertainty](v103, "horizontalUncertainty");
                if (v82 - v83 < 0.0)
                  objc_msgSend(v101, "addObject:", v55);

                v10 = v102;
                v13 = v104;
                v52 = self;
              }
            }
          }
        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
        if (v51)
          continue;
        break;
      }
    }
    v84 = v10;

    v85 = v101;
    v86 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v101);
    -[_RTMap withBlock:](v86, "withBlock:", &__block_literal_global_168);
    obj = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      v88 = objc_msgSend(obj, "count");
      objc_msgSend(v84, "identifier");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v118 = v88;
      v119 = 2112;
      v120 = v89;
      _os_log_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_INFO, "fetched %lu overlapping LOI MOs, initial identifier, %@", buf, 0x16u);

    }
    v11 = v105;
    v36 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      objc_msgSend(obj, "enumerateObjectsUsingBlock:", &__block_literal_global_171);
    v37 = v101;
    v10 = v84;
    v35 = v98;
LABEL_40:

    v33 = v103;
  }

LABEL_42:
  return v37;
}

uint64_t __125__RTRelabelerPersister_fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO_distanceCalculator_unusableIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __125__RTRelabelerPersister_fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO_distanceCalculator_unusableIdentifiers_error___block_invoke_169(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "overlapping identifier, %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)fetchLearnedLocationOfInterestVisitMOForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v8, "setPredicate:", v9);

      -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
      -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
      v30 = 0;
      -[NSObject execute:](v8, "execute:", &v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v30;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v11, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_retainAutorelease(v15);
        *a4 = v16;

      }
      else
      {
        if (v12)
        {
          v17 = v12;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("candidate visit was not found for identifier, %@"), v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0CB2D50];
        v32 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 3, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_retainAutorelease(v27);
        *a4 = v28;

      }
      v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v37 = *MEMORY[0x1E0CB2D50];
    v38[0] = CFSTR("requires a non-nil identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v29;
      v35 = 2112;
      v36 = v21;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v8 = objc_retainAutorelease(v21);
    v17 = 0;
    *a4 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v17 = 0;
  }
LABEL_15:

  return v17;
}

- (id)fetchTransitionMOsOriginatingFromVisitIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("visitIdentifierOrigin"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v8, "setPredicate:", v9);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSortDescriptors:](v8, "setSortDescriptors:", v11);

      -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
      v27 = 0;
      -[NSObject execute:](v8, "execute:", &v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v27;
      v14 = v13;
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_retainAutorelease(v17);
        *a4 = v18;

        v19 = 0;
      }
      else
      {
        v19 = v12;
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = CFSTR("requires a non-nil identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v26;
        v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v8 = objc_retainAutorelease(v23);
      v19 = 0;
      *a4 = v8;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (id)fetchTransitionMOsEndingAtVisitIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      +[RTLearnedLocationOfInterestTransitionMO fetchRequest](RTLearnedLocationOfInterestTransitionMO, "fetchRequest");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("visitIdentifierDestination"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v8, "setPredicate:", v9);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSortDescriptors:](v8, "setSortDescriptors:", v11);

      -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
      v27 = 0;
      -[NSObject execute:](v8, "execute:", &v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v27;
      v14 = v13;
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_retainAutorelease(v17);
        *a4 = v18;

        v19 = 0;
      }
      else
      {
        v19 = v12;
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D18598];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = CFSTR("requires a non-nil identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v26;
        v31 = 2112;
        v32 = v23;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v8 = objc_retainAutorelease(v23);
      v19 = 0;
      *a4 = v8;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (id)fetchLocationOfInterestMOforMapItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeMapItemIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v8, "setPredicate:", v9);

      -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
      -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
      v32 = 0;
      -[NSObject execute:](v8, "execute:", &v32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v32;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v11, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_retainAutorelease(v15);
        *a4 = v16;

      }
      else
      {
        if (v12)
        {
          v17 = v12;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LOI for mapItem identifier, %@, not found"), v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 4, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v36 = v31;
          v37 = 2112;
          v38 = v27;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v29 = objc_retainAutorelease(v27);
        *a4 = v29;

      }
      v17 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("requires a non-nil identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v30;
      v37 = 2112;
      v38 = v21;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v8 = objc_retainAutorelease(v21);
    v17 = 0;
    *a4 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v17 = 0;
  }
LABEL_15:

  return v17;
}

- (id)fetchLearnedPlaceMOforMapItemIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeMapItemIdentifier"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v8, "setPredicate:", v9);

      -[NSObject setFetchLimit:](v8, "setFetchLimit:", 1);
      -[NSObject setReturnsObjectsAsFaults:](v8, "setReturnsObjectsAsFaults:", 0);
      v50 = 0;
      -[NSObject execute:](v8, "execute:", &v50);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v50;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v11, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v42;
          v55 = 2112;
          v56 = v15;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, fetchLOIError, %@", buf, 0x16u);

        }
        v17 = objc_retainAutorelease(v15);
        v18 = 0;
        *a4 = v17;
        goto LABEL_21;
      }
      +[RTLearnedPlaceMO fetchRequest](RTLearnedPlaceMO, "fetchRequest");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v12, "placeIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPredicate:", v26);

      v49 = 0;
      objc_msgSend(v17, "execute:", &v49);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v49;
      objc_msgSend(v27, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v47 = v29;
        v48 = v28;
        v30 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v28, "userInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v44;
          v55 = 2112;
          v56 = v32;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, fetchPlaceError, %@", buf, 0x16u);

        }
        v34 = objc_retainAutorelease(v32);
        *a4 = v34;

      }
      else
      {
        if (v29)
        {
          v18 = v29;
          goto LABEL_20;
        }
        v47 = 0;
        v48 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("learnedPlaceMO was nil for identifier, %@"), v7);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v51 = *MEMORY[0x1E0CB2D50];
        v52 = v36;
        v46 = (void *)v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 5, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v54 = v45;
          v55 = 2112;
          v56 = v39;
          _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%@, learnedPlaceMOError, %@", buf, 0x16u);

        }
        v41 = objc_retainAutorelease(v39);
        *a4 = v41;

      }
      v18 = 0;
      v29 = v47;
      v28 = v48;
LABEL_20:

LABEL_21:
      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D18598];
    v57 = *MEMORY[0x1E0CB2D50];
    v58[0] = CFSTR("requires a non-nil identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v43;
      v55 = 2112;
      v56 = v22;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v8 = objc_retainAutorelease(v22);
    v18 = 0;
    *a4 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v18 = 0;
  }
LABEL_22:

  return v18;
}

- (id)fetchRevGeoLearnedPlaceInVicinityOfLocation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  RTRelabelerPersister *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v57;
  id obj;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %lu) != 0"), CFSTR("mapItemSource"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[RTMapItemMO fetchRequest](RTMapItemMO, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTRelabelerPersister relabelerPersisterParameters](self, "relabelerPersisterParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reverseGeocodePlaceFetchDistanceThreshold");
    v12 = v11;
    -[RTRelabelerPersister locationShifter](self, "locationShifter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v14 = objc_msgSend(v9, "setupBoundingBoxFetchRequestForLocation:distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:", v6, 1, v13, 0, v8, &v66, v12);
    v15 = v66;

    if ((v14 & 1) == 0)
    {
      v19 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v15);
LABEL_35:

      goto LABEL_36;
    }
    v65 = 0;
    objc_msgSend(v9, "execute:", &v65);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v65;
    v18 = v17;
    if (v17)
    {
      v19 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v17);
LABEL_34:

      goto LABEL_35;
    }
    v52 = v16;
    v53 = v15;
    v54 = v9;
    v55 = v8;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v16;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (!v21)
    {
      v57 = 0;
      goto LABEL_33;
    }
    v22 = v21;
    v57 = 0;
    v59 = *(_QWORD *)v62;
    v23 = 1.79769313e308;
LABEL_15:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v59)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v24);
      objc_msgSend(v25, "place");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_27;
      v27 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v25, "latitude");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;
      objc_msgSend(v25, "longitude");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;
      objc_msgSend(v25, "uncertainty");
      v34 = self;
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
      objc_msgSend(v25, "referenceFrame");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v27, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v39, "intValue"), v30, v33, v38);

      v6 = v35;
      self = v34;

      -[RTRelabelerPersister distanceCalculator](v34, "distanceCalculator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0;
      objc_msgSend(v41, "distanceFromLocation:toLocation:error:", v40, v6, &v60);
      v43 = v42;
      v44 = v60;

      if (v44)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v68 = v46;
          v69 = 2112;
          v70 = v44;
          _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "%@, distance error, %@", buf, 0x16u);

        }
      }
      else
      {
        -[RTRelabelerPersister relabelerPersisterParameters](v34, "relabelerPersisterParameters");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "reverseGeocodePlaceFetchDistanceThreshold");
        v49 = v48;

        if (v43 > v49 || v43 >= v23)
          goto LABEL_26;
        objc_msgSend(v25, "place");
        v45 = objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace createWithManagedObject:](RTLearnedPlace, "createWithManagedObject:", v45);
        v50 = objc_claimAutoreleasedReturnValue();

        v23 = v43;
        v57 = (void *)v50;
      }

LABEL_26:
LABEL_27:
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        if (!v22)
        {
LABEL_33:

          v9 = v54;
          v8 = v55;
          v16 = v52;
          v15 = v53;
          v18 = 0;
          v19 = v57;
          goto LABEL_34;
        }
        goto LABEL_15;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("location"));
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_36:

  return v19;
}

- (id)learnedPlaceForVisit:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 context:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  RTLearnedPlace *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  RTMapItemProviderReverseGeocode *reverseGeocodeProvider;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  RTLearnedPlace *v56;
  RTLearnedPlace *v57;
  void *v58;
  void *v59;
  RTLearnedPlace *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  const char *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  const char *aSelector;
  id v79;
  id v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  const __CFString *v86;
  uint64_t v87;
  const __CFString *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  uint64_t v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_24;
  }
  if (v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v90 = v19;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "rev geo query for visit identifier, %@", buf, 0xCu);

    }
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          aSelector = a2;
          objc_msgSend(v13, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "location");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 0;
          -[RTRelabelerPersister fetchRevGeoLearnedPlaceInVicinityOfLocation:error:](self, "fetchRevGeoLearnedPlaceInVicinityOfLocation:error:", v21, &v80);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v80;

          if (v23)
          {
            v24 = 0;
            *a7 = objc_retainAutorelease(v23);
LABEL_34:

            goto LABEL_25;
          }
          if (v22)
          {
            v24 = v22;
            goto LABEL_34;
          }
          v41 = objc_alloc(MEMORY[0x1E0D18428]);
          -[RTRelabelerPersister relabelerPersisterParameters](self, "relabelerPersisterParameters");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "reverseGeocodeLeewayDistance");
          v43 = v42;
          objc_msgSend(v13, "location");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "location");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "entryDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "exitDate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v41, "initWithinDistance:location:startDate:endDate:", v44, v45, v46, v43);

          reverseGeocodeProvider = self->_reverseGeocodeProvider;
          v79 = 0;
          -[RTMapItemProviderReverseGeocode mapItemsWithOptions:error:](reverseGeocodeProvider, "mapItemsWithOptions:error:", v47, &v79);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v79;
          objc_msgSend(v49, "firstObject");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v90 = v77;
            v91 = 2112;
            v92 = v50;
            _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "rev geo query result, %@, error, %@", buf, 0x16u);
          }

          v74 = v50;
          v75 = (void *)v47;
          if (v50)
          {
            v52 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v50, "userInfo");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 6, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v55 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            NSStringFromSelector(aSelector);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v90 = v65;
            v91 = 2112;
            v92 = v54;
            v66 = "%@, rev geo error, %@";
          }
          else
          {
            if (v77)
            {
              v57 = [RTLearnedPlace alloc];
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "mapItem");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v57, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v58, 0, 0, v59, 0, v14, v15);

              if (v60)
              {
                v61 = -[RTLearnedPlace managedObjectWithContext:](v60, "managedObjectWithContext:", v17);
                -[RTRelabelerPersister metrics](self, "metrics");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "tallyKey:", CFSTR("numberOfPlaceholderNotCollapsedRevGeoQuery"));

                v56 = v60;
                v24 = v56;
              }
              else
              {
                v67 = (void *)MEMORY[0x1E0CB35C8];
                v81 = *MEMORY[0x1E0CB2D50];
                v82 = CFSTR("learned place was nil");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 0, v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(aSelector);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v90 = v72;
                  v91 = 2112;
                  v92 = v69;
                  _os_log_error_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                }
                v71 = objc_retainAutorelease(v69);
                *a7 = v71;

                v56 = 0;
                v24 = 0;
              }
              goto LABEL_33;
            }
            v63 = (void *)MEMORY[0x1E0CB35C8];
            v83 = *MEMORY[0x1E0CB2D50];
            v84 = CFSTR("could not get a rev geo map item");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 6, v64);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v55 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
LABEL_32:

              v56 = objc_retainAutorelease(v54);
              v24 = 0;
              *a7 = v56;
LABEL_33:
              v23 = 0;
              v22 = 0;

              goto LABEL_34;
            }
            NSStringFromSelector(aSelector);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v90 = v65;
            v91 = 2112;
            v92 = v54;
            v66 = "%@, error, %@";
          }
          _os_log_error_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_ERROR, v66, buf, 0x16u);

          goto LABEL_32;
        }
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0D18598];
        v85 = *MEMORY[0x1E0CB2D50];
        v86 = CFSTR("requires a non-nil expirationDate");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 7, v38);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v31 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v32;
        v91 = 2112;
        v92 = v30;
        goto LABEL_22;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0D18598];
      v87 = *MEMORY[0x1E0CB2D50];
      v88 = CFSTR("requires a non-nil creationDate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 7, v35);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v32;
        v91 = 2112;
        v92 = v30;
        goto LABEL_22;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0D18598];
      v93 = *MEMORY[0x1E0CB2D50];
      v94[0] = CFSTR("requires a non-nil visit");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 7, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v32;
        v91 = 2112;
        v92 = v30;
LABEL_22:
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
    }
LABEL_23:

    v39 = objc_retainAutorelease(v30);
    *a7 = v39;

LABEL_24:
    v24 = 0;
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
  }

  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("context"));
  v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v24;
}

- (BOOL)restoreVisit:(id)a3 transitions:(id)a4 toOldCandidate:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSObject *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;
  const __CFString *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (a6)
  {
    if (v11)
    {
      if (v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "secondObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v16;
          v50 = 2112;
          v51 = v18;
          _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "restoring visit identifier, %@, to old map item identifier, %@", buf, 0x16u);

        }
        objc_msgSend(v14, "secondObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        -[RTRelabelerPersister fetchLocationOfInterestMOforMapItemIdentifier:error:](self, "fetchLocationOfInterestMOforMapItemIdentifier:error:", v20, &v44);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v44;

        v23 = v22 == 0;
        if (v22)
        {
          *a6 = objc_retainAutorelease(v22);
        }
        else
        {
          objc_msgSend(v11, "setLocationOfInterest:", v21);
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v33 = v12;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v41 != v36)
                  objc_enumerationMutation(v33);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "setLocationOfInterest:", v21, (_QWORD)v40);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            }
            while (v35);
          }

          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v11;
            _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "successfully restored visit, %@", buf, 0xCu);
          }

        }
        goto LABEL_26;
      }
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0D18598];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("requires a non-nil oldCandidate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 7, v32);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        v22 = objc_retainAutorelease(v27);
        v23 = 0;
        *a6 = v22;
        goto LABEL_26;
      }
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v29;
      v50 = 2112;
      v51 = v27;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0D18598];
      v52 = *MEMORY[0x1E0CB2D50];
      v53[0] = CFSTR("requires a non-nil visit");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 7, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v29;
      v50 = 2112;
      v51 = v27;
    }
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    goto LABEL_14;
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

- (BOOL)restoreToOldCandidate:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  id location[2];

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v7)
    {
      objc_initWeak(location, self);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__RTRelabelerPersister_restoreToOldCandidate_error___block_invoke;
      v17[3] = &unk_1E92A0120;
      objc_copyWeak(v19, location);
      v19[1] = (id)a2;
      v18 = v8;
      v9 = (void *)MEMORY[0x1D8232094](v17);
      v16 = 0;
      -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v9, &v16);
      v10 = v16;
      v11 = v10;
      v12 = v10 == 0;
      if (v10)
        *a4 = objc_retainAutorelease(v10);

      objc_destroyWeak(v19);
      objc_destroyWeak(location);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", (uint8_t *)location, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("oldCandidate"));
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)location, 2u);
    }

    v12 = 0;
  }

  return v12;
}

void __52__RTRelabelerPersister_restoreToOldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "fetchLearnedLocationOfInterestVisitMOForIdentifier:error:", v7, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*a3)
      {
        objc_msgSend(*(id *)(a1 + 32), "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v10, a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*a3)
          objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v8, v11, *(_QWORD *)(a1 + 32), a3);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v18;
        v21 = 2112;
        v22 = v15;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, error, %@", (uint8_t *)&v19, 0x16u);

      }
      v17 = objc_retainAutorelease(v15);
      *a3 = v17;

    }
  }
}

- (BOOL)performBlock:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t *v16;
  id v17[2];
  id location;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  if (a4)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__86;
    v23 = __Block_byref_object_dispose__86;
    v24 = 0;
    objc_initWeak(&location, self);
    -[RTRelabelerPersister context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[RTRelabelerPersister context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __43__RTRelabelerPersister_performBlock_error___block_invoke;
      v14[3] = &unk_1E92A0148;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a2;
      v16 = buf;
      v15 = v7;
      objc_msgSend(v9, "performBlockAndWait:", v14);

      v10 = (void *)*((_QWORD *)v20 + 5);
      v11 = v10 == 0;
      if (v10)
        *a4 = objc_retainAutorelease(v10);

      objc_destroyWeak(v17);
    }
    else
    {
      v11 = 0;
    }
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

void __43__RTRelabelerPersister_performBlock_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id obj;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    (*(void (**)(uint64_t, void *, id *))(v4 + 16))(v4, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;
  }

}

- (BOOL)untrustedVisitMO:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend(v4, "locationOfInterestSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "unsignedIntegerValue") & 0xFDFDE) == 0;

  objc_msgSend(v4, "locationOfInterestConfidence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  -[RTRelabelerPersister relabelerParameters](self, "relabelerParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "passthroughThreshold");
  v12 = v11;

  return v9 < v12 && v6;
}

- (double)scoreVisitMO:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSObject *v7;
  double v8;
  void *v9;
  __int16 v10;
  uint8_t v12[16];

  v4 = a3;
  if (v4)
  {
    if (-[RTRelabelerPersister untrustedVisitMO:](self, "untrustedVisitMO:", v4))
    {
      -[RTRelabelerPersister learnedPlaceParameters](self, "learnedPlaceParameters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "revGeoConfidence");
    }
    else
    {
      objc_msgSend(v4, "locationOfInterestSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if ((v10 & 0x2000) != 0)
      {
        objc_msgSend(v4, "locationOfInterestConfidence");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "doubleValue");
      }
      else
      {
        -[RTRelabelerPersister learnedPlaceParameters](self, "learnedPlaceParameters");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "nonRevGeoConfidence");
      }
    }
    v8 = v6;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMO", v12, 2u);
    }

    v8 = -1.79769313e308;
  }

  return v8;
}

- (double)scoreLOIMO:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }
    goto LABEL_14;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "visits", 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (!v5)
  {
LABEL_14:
    v8 = -1.79769313e308;
    goto LABEL_15;
  }
  v6 = v5;
  v7 = *(_QWORD *)v13;
  v8 = -1.79769313e308;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      -[RTRelabelerPersister scoreVisitMO:](self, "scoreVisitMO:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      if (v10 > v8)
        v8 = v10;
    }
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  }
  while (v6);
LABEL_15:

  return v8;
}

- (BOOL)resnapVisitsWithError:(id *)a3
{
  NSObject *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  _QWORD v13[4];
  id v14[2];
  id buf[2];

  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "resnapping learned places", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__RTRelabelerPersister_resnapVisitsWithError___block_invoke;
    v13[3] = &unk_1E92A0170;
    objc_copyWeak(v14, buf);
    v14[1] = (id)a2;
    v7 = (void *)MEMORY[0x1D8232094](v13);
    v12 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v7, &v12);
    v8 = v12;
    v9 = v8 == 0;
    if (v8)
    {
      -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v8);
      -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("resnappingErroredOut"));
      *a3 = objc_retainAutorelease(v8);
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(buf);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", (uint8_t *)buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __46__RTRelabelerPersister_resnapVisitsWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  BOOL v55;
  void *v56;
  id v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  id v89;
  void *v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v110;
  _QWORD *v111;
  void *v112;
  uint64_t v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  void *v125;
  id obj;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *context;
  id v134;
  void *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint8_t v154[128];
  uint8_t buf[4];
  void *v156;
  __int16 v157;
  double v158;
  uint64_t v159;
  _QWORD v160[4];

  v160[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
    goto LABEL_77;
  v116 = v5;
  v113 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    v16 = a3;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v159 = *MEMORY[0x1E0CB2D50];
    v160[0] = CFSTR("swelf is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, &v159, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v113 + 40));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v156 = v108;
      v157 = 2112;
      v158 = *(double *)&v20;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v22 = objc_retainAutorelease(v20);
    *v16 = v22;
    goto LABEL_76;
  }
  +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchBatchSize:", 10);
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  v151 = 0;
  v115 = v7;
  objc_msgSend(v7, "execute:", &v151);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v151;
  v117 = v8;
  v114 = v9;
  if (v9)
  {
    v10 = a3;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v113 + 40));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v156 = v107;
      v157 = 2112;
      v158 = *(double *)&v13;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, fetch visit MOs error, %@", buf, 0x16u);

      v8 = v117;
    }

    v15 = objc_retainAutorelease(v13);
    *v10 = v15;
    goto LABEL_75;
  }
  v111 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v24 = v8;
  v122 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v147, v154, 16);
  if (!v122)
  {

    goto LABEL_73;
  }
  v123 = 0;
  v120 = *(_QWORD *)v148;
  *(_QWORD *)&v25 = 138412546;
  v110 = v25;
  v121 = v24;
  v128 = WeakRetained;
  v130 = v23;
  do
  {
    v26 = 0;
    do
    {
      if (*(_QWORD *)v148 != v120)
        objc_enumerationMutation(v24);
      v27 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v26);
      v124 = v26;
      v125 = (void *)MEMORY[0x1D8231EA8]();
      if (!objc_msgSend(WeakRetained, "untrustedVisitMO:", v27))
        goto LABEL_61;
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v27, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v156 = v29;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "resnapping visit identifier, %@", buf, 0xCu);

      }
      objc_msgSend(v27, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = 0;
      objc_msgSend(WeakRetained, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v30, &v146);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v27;
      v32 = v146;

      if (v32)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v113 + 40));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v110;
          v156 = v109;
          v157 = 2112;
          v158 = *(double *)&v32;
          _os_log_error_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_ERROR, "%@, fetch transition MOs error, %@", buf, 0x16u);

        }
LABEL_70:
        objc_autoreleasePoolPop(v125);
        v123 = v32;
        v24 = v121;
        goto LABEL_71;
      }
      v134 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v27, "locationLatitude");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      v35 = v34;
      objc_msgSend(v27, "locationLongitude");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
      objc_msgSend(v27, "locationHorizontalUncertainty");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      v41 = v40;
      objc_msgSend(v27, "locationAltitude");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v44 = v43;
      objc_msgSend(v27, "locationVerticalUncertainty");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "doubleValue");
      v47 = v46;
      objc_msgSend(v31, "locationReferenceFrame");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "intValue");
      objc_msgSend(v31, "locationSourceAccuracy");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v134, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v49, (int)objc_msgSend(v50, "intValue"), v35, v38, v41, v44, v47, 0.0);

      objc_msgSend(WeakRetained, "learnedPlaceParameters");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "maxDistanceThreshold");
      v145 = 0;
      v131 = (void *)v51;
      objc_msgSend(WeakRetained, "fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:", v51, &v145);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v145;

      v118 = v53;
      if (v54)
      {
        v32 = v54;
        v55 = 0;
        v56 = v123;
        v8 = v117;
        v23 = v130;
        goto LABEL_60;
      }
      v112 = v31;
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v57 = v53;
      v23 = v130;
      v129 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
      if (!v129)
      {

        v56 = 0;
        v32 = v123;
        v55 = v123 == 0;
LABEL_58:
        v8 = v117;
        goto LABEL_59;
      }
      v56 = 0;
      obj = v57;
      v127 = *(_QWORD *)v142;
      v58 = 1.79769313e308;
      v59 = -1.79769313e308;
      while (2)
      {
        v60 = 0;
        do
        {
          v135 = v56;
          if (*(_QWORD *)v142 != v127)
            objc_enumerationMutation(obj);
          v132 = v60;
          v61 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v60);
          context = (void *)MEMORY[0x1D8231EA8]();
          v62 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v61, "mapItem");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "latitude");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "doubleValue");
          v66 = v65;
          objc_msgSend(v61, "mapItem");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "longitude");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "doubleValue");
          v70 = v69;
          objc_msgSend(v61, "mapItem");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "uncertainty");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "doubleValue");
          v74 = v73;
          objc_msgSend(v61, "mapItem");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "referenceFrame");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = (void *)objc_msgSend(v62, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v76, "intValue"), v66, v70, v74);

          WeakRetained = v128;
          objc_msgSend(v128, "distanceCalculator");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = 0;
          objc_msgSend(v78, "distanceFromLocation:toLocation:error:", v77, v131, &v140);
          v80 = v79;
          v81 = v140;

          if (v81)
          {
            v90 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v81, "userInfo");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 1, v91);
            v32 = (id)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v92 = objc_claimAutoreleasedReturnValue();
            v23 = v130;
            v56 = v135;
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(v113 + 40));
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v110;
              v156 = v104;
              v157 = 2112;
              v158 = *(double *)&v32;
              _os_log_error_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_ERROR, "%@, distance error, %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            WeakRetained = v128;
            goto LABEL_40;
          }
          objc_msgSend(v61, "identifier");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v130;
          objc_msgSend(v130, "objectForKeyedSubscript:", v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = v135;
          if (v83)
          {
            objc_msgSend(v61, "identifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "objectForKeyedSubscript:", v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "doubleValue");
            v87 = v86;
          }
          else
          {
            objc_msgSend(v128, "scoreLOIMO:", v61);
            v87 = v88;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "identifier");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "setObject:forKeyedSubscript:", v84, v85);
          }

          if (v87 > v59 || v87 == v59 && v80 < v58)
          {
            v89 = v61;

            v56 = v89;
            v59 = v87;
            v58 = v80;
          }

          objc_autoreleasePoolPop(context);
          v60 = v132 + 1;
        }
        while (v129 != v132 + 1);
        v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
        if (v129)
          continue;
        break;
      }
      v32 = v123;
LABEL_40:
      v8 = v117;

      if (!v32)
      {
        if (!v56)
        {
          v32 = 0;
          v55 = 1;
          goto LABEL_59;
        }
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v56, "identifier");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v110;
          v156 = v94;
          v157 = 2048;
          v158 = v59;
          _os_log_impl(&dword_1D1A22000, v93, OS_LOG_TYPE_INFO, "resnapped to loi identifier, %@, score, %.3f", buf, 0x16u);

        }
        objc_msgSend(v112, "locationOfInterestConfidence");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "doubleValue");
        v97 = v96;

        if (v59 > v97)
          objc_msgSend(v112, "setLocationOfInterestSource:", &unk_1E9328448);
        objc_msgSend(v112, "setLocationOfInterest:", v56, v110);
        if (v59 > 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "setLocationOfInterestConfidence:", v98);

        }
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v99 = v119;
        v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
        if (v100)
        {
          v101 = v100;
          v102 = *(_QWORD *)v137;
          do
          {
            for (i = 0; i != v101; ++i)
            {
              if (*(_QWORD *)v137 != v102)
                objc_enumerationMutation(v99);
              objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * i), "setLocationOfInterest:", v56);
            }
            v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
          }
          while (v101);
        }

        v32 = 0;
        v55 = 1;
        WeakRetained = v128;
        goto LABEL_58;
      }
      v55 = 0;
LABEL_59:
      v54 = 0;
LABEL_60:

      v123 = v32;
      if (!v55)
        goto LABEL_70;
LABEL_61:
      objc_autoreleasePoolPop(v125);
      v26 = v124 + 1;
      v24 = v121;
    }
    while (v124 + 1 != v122);
    v105 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v147, v154, 16);
    v122 = v105;
  }
  while (v105);
LABEL_71:

  if (v123)
  {
    v15 = objc_retainAutorelease(v123);
    *v111 = v15;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v116, "save:", v111, v110);
  v15 = 0;
LABEL_74:

LABEL_75:
  v22 = v114;
LABEL_76:

  v5 = v116;
LABEL_77:

}

- (BOOL)unassociateOldCandidate:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "secondObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v11;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "unassociating oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__RTRelabelerPersister_unassociateOldCandidate_error___block_invoke;
      v21[3] = &unk_1E92A0120;
      objc_copyWeak(v23, (id *)buf);
      v23[1] = (id)a2;
      v22 = v8;
      v14 = (void *)MEMORY[0x1D8232094](v21);
      v20 = 0;
      -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v14, &v20);
      v15 = v20;
      v16 = v15 == 0;
      if (v15)
      {
        -[RTRelabelerPersisterMetrics tallyKey:](self->_metrics, "tallyKey:", CFSTR("numberUnassociatedError"));
        -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v15);
        *a4 = objc_retainAutorelease(v15);
      }

      objc_destroyWeak(v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("oldCandidate"));
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
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

void __54__RTRelabelerPersister_unassociateOldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(WeakRetained, "fetchLearnedLocationOfInterestVisitMOForIdentifier:error:", v7, &v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v31;

      if (v9)
      {
        *a3 = objc_retainAutorelease(v9);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(WeakRetained, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v16, &v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v30;

        if (v18)
        {
          *a3 = objc_retainAutorelease(v18);
        }
        else
        {
          objc_msgSend(v8, "setLocationOfInterest:", 0);
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v19 = v17;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v27 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "setLocationOfInterest:", 0, (_QWORD)v26);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
            }
            while (v21);
          }

          objc_msgSend(WeakRetained, "metrics");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "tallyKey:", CFSTR("numberUnassociated"));

        }
      }

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v37 = *MEMORY[0x1E0CB2D50];
      v38[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v25;
        v35 = 2112;
        v36 = v13;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v9 = objc_retainAutorelease(v13);
      *a3 = v9;
    }

  }
}

- (BOOL)associateNonPlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30[2];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    if (v9)
    {
      objc_msgSend(v9, "mapItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (v10)
        {
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "secondObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v32 = v9;
            v33 = 2112;
            v34 = v14;
            v35 = 2112;
            v36 = v16;
            _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "associating non placeholder relabeledInferredMapItem %@, oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x20u);

          }
          objc_initWeak((id *)buf, self);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __91__RTRelabelerPersister_associateNonPlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke;
          v27[3] = &unk_1E92A0198;
          objc_copyWeak(v30, (id *)buf);
          v30[1] = (id)a2;
          v28 = v10;
          v29 = v9;
          v17 = (void *)MEMORY[0x1D8232094](v27);
          v26 = 0;
          -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v17, &v26);
          v18 = v26;
          v19 = v18 == 0;
          if (v18)
          {
            -[RTRelabelerPersisterMetrics tallyKey:](self->_metrics, "tallyKey:", CFSTR("numberOfNonPlaceholderError"));
            -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v18);
            *a5 = objc_retainAutorelease(v18);
          }

          objc_destroyWeak(v30);
          objc_destroyWeak((id *)buf);
          goto LABEL_23;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
        }

        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("oldCandidate"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem.mapItem", buf, 2u);
        }

        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("relabeledInferredMapItem.mapItem"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("relabeledInferredMapItem"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = 0;
    *a5 = v22;
    goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v19 = 0;
LABEL_23:

  return v19;
}

void __91__RTRelabelerPersister_associateNonPlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(WeakRetained, "fetchLearnedLocationOfInterestVisitMOForIdentifier:error:", v7, &v49);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v49;

      if (v9)
      {
        *a3 = objc_retainAutorelease(v9);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(WeakRetained, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v16, &v48);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v48;

        if (v18)
        {
          *a3 = objc_retainAutorelease(v18);
        }
        else
        {
          v41 = v17;
          objc_msgSend(*(id *)(a1 + 40), "mapItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0;
          objc_msgSend(WeakRetained, "fetchLocationOfInterestMOforMapItemIdentifier:error:", v20, &v47);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v47;

          if (v22)
          {
            v23 = objc_retainAutorelease(v22);
            *a3 = v23;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "secondObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0;
            objc_msgSend(WeakRetained, "fetchLocationOfInterestMOforMapItemIdentifier:error:", v25, &v46);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v46;

            if (v23)
            {
              *a3 = objc_retainAutorelease(v23);
            }
            else
            {
              objc_msgSend(v40, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "isEqual:", v28);

              objc_msgSend(WeakRetained, "metrics");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = v30;
              if (v29)
                v32 = CFSTR("numberOfNonPlaceholderSame");
              else
                v32 = CFSTR("numberOfNonPlaceholderDifferent");
              objc_msgSend(v30, "tallyKey:", v32, v40);

              objc_msgSend(v8, "setLocationOfInterest:", v21);
              v33 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(*(id *)(a1 + 40), "confidence");
              objc_msgSend(v33, "numberWithDouble:");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setLocationOfInterestConfidence:", v34);

              v44 = 0u;
              v45 = 0u;
              v42 = 0u;
              v43 = 0u;
              v35 = v41;
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              if (v36)
              {
                v37 = v36;
                v38 = *(_QWORD *)v43;
                do
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v43 != v38)
                      objc_enumerationMutation(v35);
                    objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "setLocationOfInterest:", v21);
                  }
                  v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
                }
                while (v37);
              }

              v23 = 0;
            }

          }
          v17 = v41;
        }

      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v52 = v26;
        v53 = 2112;
        v54 = v13;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v9 = objc_retainAutorelease(v13);
      *a3 = v9;
    }

  }
}

- (id)rollLOIIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v20 = 0;
    goto LABEL_22;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiIdentifier", buf, 2u);
    }

    v23 = CFSTR("loiIdentifier");
    goto LABEL_18;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v23 = CFSTR("context");
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v23);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  -[RTRelabelerPersister rollUUIDGivenUUID:](self, "rollUUIDGivenUUID:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 100;
  while (1)
  {
    v26 = 0;
    v13 = -[RTRelabelerPersister uuidConflicts:context:error:](self, "uuidConflicts:context:error:", v11, v10, &v26);
    v14 = v26;
    v15 = v14;
    if (!v13)
    {
      v11 = v11;
      v20 = v11;
      goto LABEL_21;
    }
    if (v14)
      break;
    -[RTRelabelerPersister rollUUIDGivenUUID:](self, "rollUUIDGivenUUID:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v16;
    if (!--v12)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("could not roll LOI identifier without exceeding max limit");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 0, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_retainAutorelease(v19);
      v20 = 0;
      *a5 = v15;
      v11 = (id)v16;
      goto LABEL_21;
    }
  }
  v15 = objc_retainAutorelease(v14);
  v20 = 0;
  *a5 = v15;
LABEL_21:

LABEL_22:
  return v20;
}

- (id)rollUUIDGivenUUID:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[40];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8[0] = 0;
    v8[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v8);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, 16);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), v7);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid", v7, 2u);
    }

    v4 = 0;
  }
  return v4;
}

- (BOOL)uuidConflicts:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  id v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_16;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuid", v23, 2u);
    }

    v18 = CFSTR("uuid");
    goto LABEL_15;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v22, 2u);
    }

    v18 = CFSTR("context");
LABEL_15:
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v15 = 1;
    goto LABEL_19;
  }
  +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v21 = 0;
  v12 = objc_msgSend(v9, "countForFetchRequest:error:", v10, &v21);
  v13 = v21;
  v14 = v13;
  if (v13)
  {
    *a5 = objc_retainAutorelease(v13);
    v15 = 1;
  }
  else
  {
    v15 = v12 != 0;
  }

LABEL_19:
  return v15;
}

- (BOOL)associatePlaceholderRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30[2];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a5)
  {
    if (!v9)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("relabeledInferredMapItem"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_msgSend(v9, "mapItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !relabeledInferredMapItem.mapItem", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("!relabeledInferredMapItem.mapItem"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v15 = 0;
      *a5 = v13;
      goto LABEL_14;
    }
    if (!v10)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("oldCandidate"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "secondObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v9;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v22;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "associating placeholder relabeledInferredMapItem %@, oldCandidate visit identifier, %@, oldCandidate mapItem identifier, %@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__RTRelabelerPersister_associatePlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke;
    v27[3] = &unk_1E92A0198;
    objc_copyWeak(v30, (id *)buf);
    v30[1] = (id)a2;
    v28 = v10;
    v29 = v9;
    v23 = (void *)MEMORY[0x1D8232094](v27);
    v26 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v23, &v26);
    v24 = v26;
    v15 = v24 == 0;
    if (v24)
    {
      -[RTRelabelerPersisterMetrics tallyKey:](self->_metrics, "tallyKey:", CFSTR("numberOfPlaceholderError"));
      -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v24);
      *a5 = objc_retainAutorelease(v24);
    }

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)buf);
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

    v15 = 0;
  }
LABEL_14:

  return v15;
}

void __88__RTRelabelerPersister_associatePlaceholderRelabeledInferredMapItem_oldCandidate_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  int v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  RTLearnedLocationOfInterest *v94;
  void *v95;
  void *v96;
  RTLearnedLocationOfInterest *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  _QWORD *v106;
  id v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  uint8_t v126[128];
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  id v130;
  uint64_t v131;
  _QWORD v132[4];

  v132[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0;
    objc_msgSend(WeakRetained, "fetchLearnedLocationOfInterestVisitMOForIdentifier:error:", v8, &v125);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v125;

    if (v10)
    {
      v11 = objc_retainAutorelease(v10);
      *a3 = v11;
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0;
    objc_msgSend(WeakRetained, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v17, &v124);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v124;

    if (v19)
    {
      *a3 = objc_retainAutorelease(v19);
LABEL_17:

      v11 = 0;
      goto LABEL_18;
    }
    v106 = a3;
    v107 = v5;
    v108 = v18;
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "relabelerPersisterParameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "placeholderCollapseDistanceThreshold");
    v25 = v24;
    objc_msgSend(WeakRetained, "distanceCalculator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    objc_msgSend(WeakRetained, "fetchClosestUnconcreteLocationOfInterestMOToLocation:withinDistance:distanceCalculator:error:", v22, v26, &v123, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v123;

    if (v28)
    {
      objc_msgSend(WeakRetained, "metrics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tallyError:", v28);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error in %@, %@"), CFSTR("unconcrete loi fetch"), v28);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v128 = v63;
        v129 = 2112;
        v130 = v30;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

      }
      v32 = *(_QWORD *)(a1 + 32);
      v122 = 0;
      v18 = v108;
      objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v32, &v122);
      v33 = v122;
      if (!v33)
      {
        objc_msgSend(WeakRetained, "metrics");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "tallyKey:", CFSTR("numberOfPlaceholderUnintendedRestored"));

      }
      v35 = objc_retainAutorelease(v33);
      *v106 = v35;

LABEL_14:
      v36 = 0;
LABEL_15:

LABEL_16:
      v19 = 0;
      v5 = v107;
      goto LABEL_17;
    }
    if (v27)
    {
      v36 = v27;
      objc_msgSend(WeakRetained, "metrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "tallyKey:", CFSTR("numberOfPlaceholderCollapsed"));

      v18 = v108;
    }
    else
    {
      v44 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "relabelerParameters");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "passthroughThreshold");
      v46 = +[RTRelabeler placeholderCandidate:knownPlaceTypeThreshold:](RTRelabeler, "placeholderCandidate:knownPlaceTypeThreshold:", v44);

      v47 = *(_QWORD *)(a1 + 32);
      if (v46)
      {
        v121 = 0;
        v18 = v108;
        objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v47, &v121);
        v48 = v121;
        if (!v48)
        {
          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 40), "confidence");
          objc_msgSend(v49, "numberWithDouble:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setLocationOfInterestConfidence:](v9, "setLocationOfInterestConfidence:", v50);

          -[NSObject setLocationOfInterestSource:](v9, "setLocationOfInterestSource:", &unk_1E9328460);
          objc_msgSend(WeakRetained, "metrics");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "tallyKey:", CFSTR("numberOfPlaceholderIntendedRestored"));

        }
        v30 = objc_retainAutorelease(v48);
        v36 = 0;
        *v106 = v30;
        goto LABEL_15;
      }
      objc_msgSend(*(id *)(a1 + 32), "secondObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = 0;
      objc_msgSend(WeakRetained, "fetchLearnedPlaceMOforMapItemIdentifier:error:", v53, &v120);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v120;

      if (v30)
      {
        objc_msgSend(WeakRetained, "metrics");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "tallyError:", v30);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error in %@, %@"), CFSTR("learned place fetch"), v30);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v92 = v56;
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v93;
          v129 = 2112;
          v130 = v92;
          _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

          v56 = v92;
        }

        v58 = *(_QWORD *)(a1 + 32);
        v119 = 0;
        v18 = v108;
        objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v58, &v119);
        v59 = v119;
        if (!v59)
        {
          objc_msgSend(WeakRetained, "metrics");
          v60 = v56;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "tallyKey:", CFSTR("numberOfPlaceholderUnintendedRestored"));

          v56 = v60;
        }
        v62 = objc_retainAutorelease(v59);
        *v106 = v62;

        goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "creationDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "expirationDate");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = 0;
      objc_msgSend(WeakRetained, "learnedPlaceForVisit:creationDate:expirationDate:context:error:", v64, v65, v66, v107, &v118);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v118;

      if (v67)
      {
        objc_msgSend(WeakRetained, "metrics");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "tallyError:", v67);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error in %@, %@"), CFSTR("learned place lookup"), v67);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v69 = objc_claimAutoreleasedReturnValue();
        v28 = 0;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = v98;
          v129 = 2112;
          v130 = v104;
          _os_log_error_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

        }
        v70 = *(_QWORD *)(a1 + 32);
        v117 = 0;
        v18 = v108;
        objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v70, &v117);
        v71 = v117;
        if (!v71)
        {
          objc_msgSend(WeakRetained, "metrics");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "tallyKey:", CFSTR("numberOfPlaceholderUnintendedRestored"));

        }
        v73 = objc_retainAutorelease(v71);
        v36 = 0;
        *v106 = v73;
        v74 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "secondObject");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "identifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = 0;
        objc_msgSend(WeakRetained, "fetchLocationOfInterestMOforMapItemIdentifier:error:", v76, &v116);
        v103 = (id)objc_claimAutoreleasedReturnValue();
        v77 = v116;

        v104 = v77;
        if (v77)
        {
          objc_msgSend(WeakRetained, "metrics");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "tallyError:", v77);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error in %@, %@"), CFSTR("old LOI lookup"), v77);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v79 = objc_claimAutoreleasedReturnValue();
          v18 = v108;
          v28 = 0;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v128 = v99;
            v129 = 2112;
            v130 = v102;
            _os_log_error_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

          }
          v80 = *(_QWORD *)(a1 + 32);
          v115 = 0;
          objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v80, &v115);
          v81 = v115;
          if (!v81)
          {
            objc_msgSend(WeakRetained, "metrics");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "tallyKey:", CFSTR("numberOfPlaceholderUnintendedRestored"));

          }
          v83 = objc_retainAutorelease(v81);
          v36 = 0;
          *v106 = v83;
          v74 = 1;
        }
        else
        {
          objc_msgSend(v103, "identifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = 0;
          objc_msgSend(WeakRetained, "rollLOIIdentifier:context:error:", v84, v107, &v114);
          v83 = (id)objc_claimAutoreleasedReturnValue();
          v85 = v114;

          v102 = v85;
          if (v85)
          {
            objc_msgSend(WeakRetained, "metrics");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "tallyError:", v85);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error in %@, %@"), CFSTR("rolling identifier"), v85);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v87 = objc_claimAutoreleasedReturnValue();
            v18 = v108;
            v28 = 0;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 56));
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v128 = v100;
              v129 = 2112;
              v130 = v101;
              _os_log_error_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_ERROR, "%@,%@", buf, 0x16u);

            }
            v88 = *(_QWORD *)(a1 + 32);
            v113 = 0;
            objc_msgSend(WeakRetained, "restoreVisit:transitions:toOldCandidate:error:", v9, v108, v88, &v113);
            v89 = v113;
            if (!v89)
            {
              objc_msgSend(WeakRetained, "metrics");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "tallyKey:", CFSTR("numberOfPlaceholderUnintendedRestored"));

            }
            v91 = objc_retainAutorelease(v89);
            *v106 = v91;

            v36 = 0;
            v74 = 1;
          }
          else
          {
            v94 = [RTLearnedLocationOfInterest alloc];
            objc_msgSend(*(id *)(a1 + 32), "firstObject");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "location");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v94, "initWithIdentifier:location:place:visits:transitions:", v83, v96, v105, 0, 0);

            v101 = v97;
            -[RTLearnedLocationOfInterest managedObjectWithContext:](v97, "managedObjectWithContext:", v107);
            v36 = (id)objc_claimAutoreleasedReturnValue();
            v74 = 0;
            v18 = v108;
            v28 = 0;
          }

        }
        v67 = 0;
        v73 = v103;
      }

      if (v74)
        goto LABEL_16;
    }
    -[NSObject setLocationOfInterest:](v9, "setLocationOfInterest:", v36);
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "confidence");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLocationOfInterestConfidence:](v9, "setLocationOfInterestConfidence:", v39);

    -[NSObject setLocationOfInterestSource:](v9, "setLocationOfInterestSource:", &unk_1E9328460);
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v30 = v18;
    v40 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v110 != v42)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "setLocationOfInterest:", v36);
        }
        v41 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v109, v126, 16);
      }
      while (v41);
      v18 = v108;
    }
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0D18598];
  v131 = *MEMORY[0x1E0CB2D50];
  v132[0] = CFSTR("strongified welf not retained");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, &v131, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v128 = v15;
    v129 = 2112;
    v130 = v11;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

  }
LABEL_18:

}

- (BOOL)useRelabeledInferredMapItem:(id)a3 oldCandidate:(id)a4 associate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  _BOOL8 v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (a6)
  {
    if (v10)
    {
      if (v11)
      {
        if (v7)
        {
          objc_msgSend(v10, "mapItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v28 = 0;
            v14 = (id *)&v28;
            -[RTRelabelerPersister associateNonPlaceholderRelabeledInferredMapItem:oldCandidate:error:](self, "associateNonPlaceholderRelabeledInferredMapItem:oldCandidate:error:", v10, v12, &v28);
          }
          else
          {
            v27 = 0;
            v14 = (id *)&v27;
            -[RTRelabelerPersister associatePlaceholderRelabeledInferredMapItem:oldCandidate:error:](self, "associatePlaceholderRelabeledInferredMapItem:oldCandidate:error:", v10, v12, &v27);
          }
        }
        else
        {
          v29 = 0;
          v14 = (id *)&v29;
          -[RTRelabelerPersister unassociateOldCandidate:error:](self, "unassociateOldCandidate:error:", v11, &v29);
        }
        v20 = *v14;
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "secondObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v31 = v10;
          v32 = 2112;
          v33 = v24;
          v34 = 2112;
          v35 = v26;
          v36 = 2048;
          v37 = v7;
          v38 = 2112;
          v39 = v20;
          _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "used relabelInferredMapItem, %@, oldCandidate visit identifier, %@, oldCandidate map item ientifier, %@, associate, %lu, error, %@", buf, 0x34u);

        }
        v16 = v20 == 0;
        if (v20)
          *a6 = objc_retainAutorelease(v20);

        goto LABEL_24;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: oldCandidate", buf, 2u);
      }

      v18 = CFSTR("oldCandidate");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeledInferredMapItem", buf, 2u);
      }

      v18 = CFSTR("relabeledInferredMapItem");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v18);
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v16 = 0;
LABEL_24:

  return v16;
}

- (BOOL)combineOverlappingRevGeoLOIsStabilized:(BOOL *)a3 error:(id *)a4
{
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[6];
  id v17[2];
  id location;
  uint8_t v19[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (a3)
    {
      *(_QWORD *)v19 = 0;
      v20 = v19;
      v21 = 0x2020000000;
      v22 = 1;
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __69__RTRelabelerPersister_combineOverlappingRevGeoLOIsStabilized_error___block_invoke;
      v16[3] = &unk_1E92A01C0;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a2;
      v16[4] = self;
      v16[5] = v19;
      v8 = (void *)MEMORY[0x1D8232094](v16);
      v15 = 0;
      -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v8, &v15);
      v9 = v15;
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "relabeling combined with error, %@", buf, 0xCu);
      }

      v11 = v9 == 0;
      if (v9)
      {
        -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v9);
        -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("combineErroredOut"));
        *a4 = objc_retainAutorelease(v9);
      }
      else
      {
        *a3 = v20[24];
      }

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
      _Block_object_dispose(v19, 8);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stabilized", v19, 2u);
      }

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("stabilized"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v19, 2u);
    }

    return 0;
  }
  return v11;
}

void __69__RTRelabelerPersister_combineOverlappingRevGeoLOIsStabilized_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _UNKNOWN **v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  _QWORD *v86;
  id v87;
  NSObject *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *context;
  void *v99;
  id obj;
  uint64_t v101;
  void *v102;
  id WeakRetained;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _QWORD v127[2];
  _QWORD v128[3];
  void *v129;
  uint8_t buf[4];
  uint64_t v131;
  __int16 v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD v135[4];

  v135[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v101 = a1;
    if (!WeakRetained)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D18598];
      v134 = *MEMORY[0x1E0CB2D50];
      v135[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, &v134, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v101 + 56));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v131 = (uint64_t)v81;
        v132 = 2112;
        v133 = (uint64_t)v25;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v6 = objc_retainAutorelease(v25);
      *a3 = v6;
      goto LABEL_70;
    }
    if (objc_msgSend(v5, "save:", a3))
    {
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("visits"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expressionForFunction:arguments:", CFSTR("count:"), v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc_init(MEMORY[0x1E0C97B30]);
      objc_msgSend(v11, "setName:", CFSTR("visitCount"));
      v91 = (void *)v10;
      objc_msgSend(v11, "setExpression:", v10);
      objc_msgSend(v11, "setExpressionResultType:", 200);
      v128[0] = CFSTR("identifier");
      v128[1] = CFSTR("placeCreationDate");
      v90 = v11;
      v128[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPropertiesToFetch:", v12);

      objc_msgSend(v6, "setResultType:", 2);
      objc_msgSend(v6, "setReturnsObjectsAsFaults:", 1);
      objc_msgSend(v6, "setFetchBatchSize:", 1);
      v122 = 0;
      v92 = v5;
      objc_msgSend(v5, "executeFetchRequest:error:", v6, &v122);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v122;
      v15 = v14;
      if (v14)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v14, "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v101 + 56));
          v82 = v15;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v131 = (uint64_t)v83;
          v132 = 2112;
          v133 = (uint64_t)v18;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          v15 = v82;
        }

        v20 = objc_retainAutorelease(v18);
        *a3 = v20;
        v21 = v13;
        goto LABEL_69;
      }
      v87 = v6;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("visitCount"), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = v27;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("placeCreationDate"), 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v127[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sortedArrayUsingDescriptors:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v30, "count"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v21 = v30;
      v31 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
      v32 = v21;
      v96 = v31;
      if (!v31)
        goto LABEL_67;
      v93 = 0;
      v95 = *(_QWORD *)v119;
      v33 = v101;
      v34 = &off_1E9294000;
      v86 = a3;
      v89 = v21;
      v102 = v20;
LABEL_13:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v119 != v95)
          objc_enumerationMutation(v21);
        v97 = v35;
        v36 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v35);
        context = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("identifier"));
        v37 = objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v131 = v37;
          _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "collapsing loi identifier, %@", buf, 0xCu);
        }

        objc_msgSend(v20, "member:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = (void *)v37;
        if (v39)
        {
          _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "already processed", buf, 2u);
          }
        }
        else
        {
          objc_msgSend(v34[344], "fetchRequest");
          v41 = objc_claimAutoreleasedReturnValue();
          -[NSObject setReturnsObjectsAsFaults:](v41, "setReturnsObjectsAsFaults:", 0);
          -[NSObject setFetchLimit:](v41, "setFetchLimit:", 1);
          v85 = v37;
          v40 = v41;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v85);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setPredicate:](v40, "setPredicate:", v42);

          v117 = 0;
          -[NSObject execute:](v40, "execute:", &v117);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v117;
          objc_msgSend(v43, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v77 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v44, "userInfo");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v78);
            v79 = objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(v101 + 56));
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v131 = (uint64_t)v84;
              v132 = 2112;
              v133 = v79;
              _os_log_error_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            v93 = (id)v79;
            v20 = v102;
            goto LABEL_65;
          }
          if (v45)
          {
            v20 = v102;
            if ((objc_msgSend(*(id *)(v33 + 32), "unconcreteLOIMO:", v45) & 1) != 0)
            {
              objc_msgSend(WeakRetained, "distanceCalculator");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = 0;
              objc_msgSend(WeakRetained, "fetchOverlappingUnconcreteLocationOfInterestMOsForLOIMO:distanceCalculator:unusableIdentifiers:error:", v45, v46, v102, &v116);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v116;

              v94 = v47;
              if (v48)
              {
                v49 = v93;
                v93 = v48;
                v50 = v99;
              }
              else
              {
                v50 = v99;
                objc_msgSend(v102, "addObject:", v99);
                v114 = 0u;
                v115 = 0u;
                v112 = 0u;
                v113 = 0u;
                v49 = v47;
                v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
                if (v54)
                {
                  v55 = v54;
                  obj = v49;
                  v88 = v40;
                  v56 = *(_QWORD *)v113;
                  do
                  {
                    for (i = 0; i != v55; ++i)
                    {
                      if (*(_QWORD *)v113 != v56)
                        objc_enumerationMutation(obj);
                      v58 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
                      v59 = (void *)MEMORY[0x1D8231EA8]();
                      v108 = 0u;
                      v109 = 0u;
                      v110 = 0u;
                      v111 = 0u;
                      objc_msgSend(v58, "visits");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v60, "set");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v61, "allObjects");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();

                      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                      if (v63)
                      {
                        v64 = v63;
                        v65 = *(_QWORD *)v109;
                        do
                        {
                          for (j = 0; j != v64; ++j)
                          {
                            if (*(_QWORD *)v109 != v65)
                              objc_enumerationMutation(v62);
                            objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * j), "setLocationOfInterest:", v45);
                          }
                          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
                        }
                        while (v64);
                      }

                      v106 = 0u;
                      v107 = 0u;
                      v104 = 0u;
                      v105 = 0u;
                      objc_msgSend(v58, "transitions");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "allObjects");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();

                      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
                      if (v69)
                      {
                        v70 = v69;
                        v71 = *(_QWORD *)v105;
                        do
                        {
                          for (k = 0; k != v70; ++k)
                          {
                            if (*(_QWORD *)v105 != v71)
                              objc_enumerationMutation(v68);
                            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * k), "setLocationOfInterest:", v45);
                          }
                          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
                        }
                        while (v70);
                      }

                      objc_msgSend(v58, "identifier");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = v102;
                      objc_msgSend(v102, "addObject:", v73);

                      objc_msgSend(WeakRetained, "metrics");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "tallyKey:", CFSTR("numberOfLOIsCollapsed"));

                      v33 = v101;
                      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v101 + 40) + 8) + 24) = 0;
                      objc_autoreleasePoolPop(v59);
                    }
                    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
                  }
                  while (v55);
                  a3 = v86;
                  v34 = &off_1E9294000;
                  v50 = v99;
                  v49 = obj;
                  v48 = 0;
                  v40 = v88;
                }
              }

              objc_autoreleasePoolPop(context);
              v75 = v48;
              v21 = v89;
              if (v75)
                goto LABEL_65;
              goto LABEL_34;
            }
            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "not an unconcrete loi", buf, 2u);
            }

            objc_msgSend(v45, "identifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "addObject:", v53);

          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
            v51 = objc_claimAutoreleasedReturnValue();
            v20 = v102;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "was deleted", buf, 2u);
            }

            objc_msgSend(v102, "addObject:", v99);
          }

        }
        objc_autoreleasePoolPop(context);
LABEL_34:
        v35 = v97 + 1;
        if (v97 + 1 == v96)
        {
          v76 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
          v96 = v76;
          if (v76)
            goto LABEL_13;
LABEL_65:

          if (v93)
          {
            v32 = objc_retainAutorelease(v93);
            *a3 = v32;
LABEL_67:

          }
          v15 = 0;
          v6 = v87;
LABEL_69:

          v5 = v92;
LABEL_70:

          break;
        }
      }
    }

  }
}

- (BOOL)cleanUpWithError:(id *)a3
{
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  _QWORD v13[4];
  id v14[2];
  id location;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__RTRelabelerPersister_cleanUpWithError___block_invoke;
    v13[3] = &unk_1E92A0170;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    v6 = (void *)MEMORY[0x1D8232094](v13);
    v12 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v12);
    v7 = v12;
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "relabeling cleaned up with error, %@", buf, 0xCu);
    }

    v9 = v7 == 0;
    if (v7)
    {
      -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v7);
      -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("cleanUpErroredOut"));
      *a3 = objc_retainAutorelease(v7);
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __41__RTRelabelerPersister_cleanUpWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;
  uint64_t v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v63 = a1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v90 = *MEMORY[0x1E0CB2D50];
      v91[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 0, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v63 + 40));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v87 = v59;
        v88 = 2112;
        v89 = (uint64_t)v19;
        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v21 = objc_retainAutorelease(v19);
      *a3 = v21;
LABEL_41:

      goto LABEL_42;
    }
    +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReturnsObjectsAsFaults:", 1);
    objc_msgSend(v7, "setFetchBatchSize:", 1);
    v81 = 0;
    v62 = v7;
    objc_msgSend(v7, "execute:", &v81);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v81;
    v61 = v9;
    if (v9)
    {
      v10 = v8;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v9, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 2, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(v63 + 40));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v87 = v58;
        v88 = 2112;
        v89 = (uint64_t)v13;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v15 = objc_retainAutorelease(v13);
      *a3 = v15;
LABEL_40:

      v21 = v62;
      goto LABEL_41;
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v15 = v8;
    v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    v10 = v8;
    if (!v22)
      goto LABEL_40;
    v23 = v22;
    v60 = v8;
    v24 = *(_QWORD *)v78;
    v64 = *MEMORY[0x1E0CB2D50];
    v65 = *(_QWORD *)v78;
    v66 = v15;
LABEL_12:
    v25 = 0;
    v67 = v23;
    while (1)
    {
      if (*(_QWORD *)v78 != v24)
        objc_enumerationMutation(v15);
      v26 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v25);
      objc_msgSend(v26, "visits");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {

      }
      else
      {
        objc_msgSend(v26, "transitions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (!v29)
        {
          objc_msgSend(v26, "placeType");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "unsignedIntegerValue");

          if (!v55)
          {
            objc_msgSend(WeakRetained, "metrics");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "tallyKey:", CFSTR("numberOfLOIsCleanedUp"));

            objc_msgSend(v5, "deleteObject:", v26);
          }
          goto LABEL_37;
        }
      }
      objc_msgSend(v26, "visits");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v31)
      {
        objc_msgSend(v26, "visits");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "array");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTRelabelerPersister locationFromAggregateVisits:](RTRelabelerPersister, "locationFromAggregateVisits:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "updateWithLearnedLocation:", v34);
      }
      else
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v26, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("LOI found with zero visits and non zero transitions, identifier, %@"), v36);
        v37 = objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x1E0CB35C8];
        v83 = v64;
        v84 = v37;
        v69 = (void *)v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 7, v39);
        v40 = objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(v63 + 40));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v87 = v57;
          v88 = 2112;
          v89 = v40;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v71 = v25;

        if (v40)
        {
          objc_msgSend(WeakRetained, "metrics");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "tallyError:", v40);

        }
        v68 = (void *)v40;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v70 = v26;
        objc_msgSend(v26, "transitions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "allObjects");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v74 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              objc_msgSend(v49, "visitIdentifierDestination");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = 0;
              objc_msgSend(WeakRetained, "fetchLearnedLocationOfInterestVisitMOForIdentifier:error:", v50, &v72);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v72;

              if (v52)
              {
                objc_msgSend(v5, "deleteObject:", v49);
                objc_msgSend(WeakRetained, "metrics");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "tallyError:", v52);
              }
              else
              {
                objc_msgSend(v51, "locationOfInterest");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setLocationOfInterest:", v53);
              }

            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
          }
          while (v46);
        }

        objc_msgSend(v5, "deleteObject:", v70);
        v24 = v65;
        v15 = v66;
        v23 = v67;
        v25 = v71;
      }
LABEL_37:
      if (++v25 == v23)
      {
        v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
        if (!v23)
        {
          v10 = v60;
          goto LABEL_40;
        }
        goto LABEL_12;
      }
    }
  }
LABEL_42:

}

- (BOOL)iterativelyCollapseOverlappingRevGeoLOIsWithError:(id *)a3
{
  id v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  if (a3)
  {
    v16 = 0;
    -[RTRelabelerPersister cleanUpWithError:](self, "cleanUpWithError:", &v16);
    v5 = v16;
    if (v5)
    {
LABEL_3:
      v6 = objc_retainAutorelease(v5);
      v7 = 0;
      *a3 = v6;
    }
    else
    {
      buf[0] = 0;
      v8 = -1;
      while (1)
      {
        -[RTRelabelerPersister relabelerPersisterParameters](self, "relabelerPersisterParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "maxCollapseIterations");

        if (++v8 >= v10)
        {
LABEL_12:
          v6 = 0;
          v7 = 1;
          goto LABEL_14;
        }
        v15 = 0;
        -[RTRelabelerPersister combineOverlappingRevGeoLOIsStabilized:error:](self, "combineOverlappingRevGeoLOIsStabilized:error:", buf, &v15);
        v11 = v15;
        if (v11)
          break;
        v14 = 0;
        -[RTRelabelerPersister cleanUpWithError:](self, "cleanUpWithError:", &v14);
        v5 = v14;
        if (v5)
          goto LABEL_3;
        -[RTRelabelerPersisterMetrics tallyKey:](self->_metrics, "tallyKey:", CFSTR("numberOfCombineIterations"));
        if (buf[0])
          goto LABEL_12;
      }
      v12 = objc_retainAutorelease(v11);
      *a3 = v12;

      v7 = 0;
      v6 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (BOOL)moveVisitMOs:(id)a3 toLOIMO:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  BOOL v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  id *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_29;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_33:

      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("visitMOs"));
      v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    *(_WORD *)buf = 0;
LABEL_36:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMOs", buf, 2u);
    goto LABEL_33;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
    }

    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("loiMO"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    v27 = 0;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    *(_WORD *)buf = 0;
    goto LABEL_36;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v13)
  {
    v14 = v13;
    v33 = a5;
    obj = v12;
    v15 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        -[RTRelabelerPersister fetchTransitionMOsEndingAtVisitIdentifier:error:](self, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v19, &v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v39;

        if (v21)
        {

          objc_autoreleasePoolPop(v18);
          v12 = obj;

          v28 = objc_retainAutorelease(v21);
          v27 = 0;
          *v33 = v28;
          goto LABEL_31;
        }
        objc_msgSend(v17, "setLocationOfInterest:", v10);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v22 = v20;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v36 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "setLocationOfInterest:", v10, v33);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          }
          while (v24);
        }

        objc_autoreleasePoolPop(v18);
      }
      v12 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v14)
        continue;
      break;
    }
  }
  v27 = 1;
  v28 = v12;
LABEL_31:

LABEL_34:
  return v27;
}

- (id)dedupableLOIsNearLocation:(id)a3 mapItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    if (v8)
    {
      if (v9)
      {
        v35 = 0;
        -[RTRelabelerPersister fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:](self, "fetchNearbyLocationOfInterestMOsAroundLocation:withinDistance:error:", v8, &v35, 1000.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v35;
        v13 = v12;
        if (v12)
        {
          v30 = 0;
          *a5 = objc_retainAutorelease(v12);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v29 = v11;
          v18 = v11;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                v24 = (void *)MEMORY[0x1D8231EA8]();
                v25 = (void *)MEMORY[0x1E0D183E8];
                objc_msgSend(v23, "mapItem");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "createWithManagedObject:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27 && objc_msgSend(v27, "isEqual:", v10))
                  objc_msgSend(v30, "addObject:", v23);

                objc_autoreleasePoolPop(v24);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
            }
            while (v20);
          }

          v11 = v29;
          v13 = 0;
        }

        goto LABEL_28;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", buf, 2u);
      }

      v16 = CFSTR("mapItem");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
      }

      v16 = CFSTR("location");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v30 = 0;
LABEL_28:

  return v30;
}

- (id)connectedComponentForLoiMO:(id)a3 encounteredIdentifiers:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  int v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  const __CFString *v54;
  NSObject *v55;
  id *v57;
  id v58;
  void *v59;
  id v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *context;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t buf[16];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v7, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v57 = a5;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v7;
          objc_msgSend(v7, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13);

          v60 = 0;
          do
          {
            if (!objc_msgSend(v12, "count"))
              break;
            context = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v12, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_alloc(MEMORY[0x1E0D183B0]);
            objc_msgSend(v14, "locationLatitude");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "doubleValue");
            v17 = v16;
            objc_msgSend(v14, "locationLongitude");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "doubleValue");
            v19 = v18;
            objc_msgSend(v14, "locationHorizontalUncertainty");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "doubleValue");
            v21 = v20;
            objc_msgSend(v14, "locationAltitude");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;
            objc_msgSend(v14, "locationVerticalUncertainty");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;
            objc_msgSend(v14, "locationReferenceFrame");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "intValue");
            objc_msgSend(v14, "locationSourceAccuracy");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v15, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v29, (int)objc_msgSend(v30, "intValue"), v17, v19, v21, v24, v27, 0.0);

            v32 = (void *)MEMORY[0x1E0D183E8];
            objc_msgSend(v14, "mapItem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "createWithManagedObject:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = (void *)v31;
            if (!v31)
              goto LABEL_11;
            if (v34)
            {
              v73 = 0;
              -[RTRelabelerPersister dedupableLOIsNearLocation:mapItem:error:](self, "dedupableLOIsNearLocation:mapItem:error:", v31, v34, &v73);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v73;
              v38 = v37;
              if (v37)
              {
                v39 = v37;

                v40 = 15;
                v60 = v39;
              }
              else
              {
                v59 = v36;
                v63 = v34;
                v65 = v35;
                v67 = v14;
                v71 = 0u;
                v72 = 0u;
                v69 = 0u;
                v70 = 0u;
                v41 = v36;
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
                if (v42)
                {
                  v43 = v42;
                  v44 = *(_QWORD *)v70;
                  do
                  {
                    for (i = 0; i != v43; ++i)
                    {
                      if (*(_QWORD *)v70 != v44)
                        objc_enumerationMutation(v41);
                      v46 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                      objc_msgSend(v46, "identifier");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v47)
                      {
                        objc_msgSend(v46, "identifier");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "member:", v48);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v49)
                        {
                          objc_msgSend(v46, "identifier");
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v9, "addObject:", v50);

                          objc_msgSend(v11, "addObject:", v46);
                          objc_msgSend(v12, "addObject:", v46);
                        }
                      }
                    }
                    v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
                  }
                  while (v43);
                }

                objc_msgSend(v12, "removeObjectAtIndex:", 0);
                v40 = 0;
                v35 = v65;
                v14 = v67;
                v34 = v63;
                v38 = 0;
                v36 = v59;
              }

            }
            else
            {
LABEL_11:
              objc_msgSend(v12, "removeObjectAtIndex:", 0);
              v40 = 14;
            }

            objc_autoreleasePoolPop(context);
          }
          while (v40 != 15);
          if (v60)
          {
            v51 = 0;
            *v57 = objc_retainAutorelease(v60);
          }
          else
          {
            v51 = v11;
          }

          v7 = v58;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
          v51 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_40;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encounteredIdentifiers", buf, 2u);
      }

      v54 = CFSTR("encounteredIdentifiers");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loiMO", buf, 2u);
      }

      v54 = CFSTR("loiMO");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v54);
    v51 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
  }

  v51 = 0;
LABEL_40:

  return v51;
}

- (id)loiToMoveToFromConnectedComponent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: connectedComponent", buf, 2u);
    }

    goto LABEL_22;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (!v5)
  {
LABEL_22:
    v7 = 0;
    goto LABEL_23;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      if (v7)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "mapItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mapItemSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue") & 0xFDFDE;

        objc_msgSend(v7, "mapItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mapItemSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue") & 0xFDFDE;

        if (v13)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
          goto LABEL_14;
        if ((v13 != 0) == (v16 != 0))
        {
          objc_msgSend(v7, "visits");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");
          objc_msgSend(v10, "visits");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v19 < v21)
          {
LABEL_14:
            v22 = v10;

            v7 = v22;
          }
        }
      }
      else
      {
        v7 = v10;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  }
  while (v6);
LABEL_23:

  return v7;
}

- (BOOL)dedupeLOIsWithError:(id *)a3
{
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15[2];
  id location;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__RTRelabelerPersister_dedupeLOIsWithError___block_invoke;
    v14[3] = &unk_1E92A0170;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a2;
    v6 = (void *)MEMORY[0x1D8232094](v14);
    v13 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v13);
    v7 = v13;
    v8 = v7 == 0;
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        v19 = 2112;
        v20 = v7;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, error in deduping, %@", buf, 0x16u);

      }
      *a3 = objc_retainAutorelease(v7);
    }

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v8;
}

void __44__RTRelabelerPersister_dedupeLOIsWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *context;
  void *v53;
  id v54;
  void *v55;
  id obj;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setReturnsObjectsAsFaults:", 1);
      objc_msgSend(v7, "setFetchBatchSize:", 1);
      v67 = 0;
      objc_msgSend(v7, "execute:", &v67);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v67;
      v10 = v9;
      if (v9)
      {
        *a3 = objc_retainAutorelease(v9);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v54 = v8;
        v16 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        if (v16)
        {
          v51 = v16;
          v48 = v5;
          v49 = *(_QWORD *)v64;
          v55 = WeakRetained;
          v46 = v7;
          v47 = a3;
          v45 = v8;
          while (2)
          {
            v17 = 0;
            v18 = v53;
            v19 = v54;
            v20 = v49;
            v21 = v51;
            do
            {
              if (*(_QWORD *)v64 != v20)
                objc_enumerationMutation(v19);
              v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v17);
              v23 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v22, "identifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v22, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "member:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  context = v23;
                  v62 = 0;
                  objc_msgSend(WeakRetained, "connectedComponentForLoiMO:encounteredIdentifiers:error:", v22, v18, &v62);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v62;
                  if (v28)
                  {
                    v41 = v28;
LABEL_32:

                    objc_autoreleasePoolPop(context);
                    a3 = v47;
                    v5 = v48;
                    v8 = v45;
                    v7 = v46;
                    v10 = 0;
                    goto LABEL_34;
                  }
                  objc_msgSend(WeakRetained, "loiToMoveToFromConnectedComponent:", v27);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v29)
                  {
                    v60 = 0u;
                    v61 = 0u;
                    v58 = 0u;
                    v59 = 0u;
                    v50 = v27;
                    obj = v27;
                    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
                    if (v30)
                    {
                      v31 = v30;
                      v32 = *(_QWORD *)v59;
                      while (2)
                      {
                        for (i = 0; i != v31; ++i)
                        {
                          if (*(_QWORD *)v59 != v32)
                            objc_enumerationMutation(obj);
                          v34 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                          v35 = (void *)MEMORY[0x1D8231EA8]();
                          objc_msgSend(v34, "identifier");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v29, "identifier");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          v38 = objc_msgSend(v36, "isEqual:", v37);

                          if ((v38 & 1) == 0)
                          {
                            objc_msgSend(v34, "visits");
                            v39 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v39, "array");
                            v40 = (void *)objc_claimAutoreleasedReturnValue();
                            v57 = 0;
                            objc_msgSend(v55, "moveVisitMOs:toLOIMO:error:", v40, v29, &v57);
                            v41 = v57;

                            if (v41)
                            {
                              objc_autoreleasePoolPop(v35);

                              WeakRetained = v55;
                              v27 = v50;
                              goto LABEL_32;
                            }
                          }
                          objc_autoreleasePoolPop(v35);
                        }
                        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
                        if (v31)
                          continue;
                        break;
                      }
                    }

                    WeakRetained = v55;
                    v18 = v53;
                    v20 = v49;
                    v27 = v50;
                  }

                  v19 = v54;
                  v21 = v51;
                  v23 = context;
                }
              }
              objc_autoreleasePoolPop(v23);
              ++v17;
            }
            while (v17 != v21);
            v42 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
            v41 = 0;
            a3 = v47;
            v5 = v48;
            v8 = v45;
            v7 = v46;
            v10 = 0;
            v51 = v42;
            if (v42)
              continue;
            break;
          }
        }
        else
        {
          v41 = 0;
        }
LABEL_34:

        v43 = objc_retainAutorelease(v41);
        *a3 = v43;

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D18598];
      v74 = *MEMORY[0x1E0CB2D50];
      v75[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v71 = v44;
        v72 = 2112;
        v73 = v14;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v7 = objc_retainAutorelease(v14);
      *a3 = v7;
    }

  }
}

- (BOOL)combineEarlierVisitMO:(id)a3 withLaterVisitMO:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  NSObject *v44;
  const __CFString *v45;
  NSObject *v46;
  uint8_t v48[8];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    if (v7)
    {
      if (v8)
      {
        objc_msgSend(v7, "entryDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEntryDate:", v10);

        objc_msgSend(v7, "expirationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "expirationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isAfterDate:", v12))
          v13 = v7;
        else
          v13 = v9;
        objc_msgSend(v13, "expirationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setExpirationDate:", v14);

        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "locationOfInterestConfidence");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        objc_msgSend(v9, "locationOfInterestConfidence");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        if (v18 >= v21)
          v22 = v18;
        else
          v22 = v21;
        objc_msgSend(v15, "numberWithDouble:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocationOfInterestConfidence:", v23);

        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "locationOfInterestSource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");
        objc_msgSend(v9, "locationOfInterestSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v27, "unsignedIntegerValue") | v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocationOfInterestSource:", v28);

        v29 = (void *)objc_opt_class();
        v49[0] = v7;
        v49[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "locationFromAggregateVisits:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v31, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "latitude");
        objc_msgSend(v32, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocationLatitude:", v34);

        v35 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v31, "location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "longitude");
        objc_msgSend(v35, "numberWithDouble:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocationLongitude:", v37);

        v38 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v31, "location");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "horizontalUncertainty");
        objc_msgSend(v38, "numberWithDouble:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLocationHorizontalUncertainty:", v40);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "dataPointCount"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDataPointCount:", v41);

        v42 = 1;
        goto LABEL_21;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v48 = 0;
        _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: laterVisitMO", v48, 2u);
      }

      v45 = CFSTR("laterVisitMO");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v48 = 0;
        _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: earlierVisitMO", v48, 2u);
      }

      v45 = CFSTR("earlierVisitMO");
    }
    _RTErrorInvalidParameterCreate((uint64_t)v45);
    v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v48 = 0;
    _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v48, 2u);
  }

  v42 = 0;
LABEL_21:

  return v42;
}

- (BOOL)cleanUpCombinedPairs:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  id v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  RTRelabelerPersister *v47;
  id obj;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v37 = 0;
    goto LABEL_47;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: combinedPairs", buf, 2u);
    }

    v40 = CFSTR("combinedPairs");
    goto LABEL_44;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v40 = CFSTR("context");
LABEL_44:
    _RTErrorInvalidParameterCreate((uint64_t)v40);
    v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    v45 = a5;
    v47 = self;
    v43 = v8;
    v44 = *(_QWORD *)v62;
    while (2)
    {
      v14 = 0;
      v46 = v12;
      do
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v14);
        objc_msgSend(v15, "firstObject", v43);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "secondObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v16;
        objc_msgSend(v16, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        -[RTRelabelerPersister fetchTransitionMOsEndingAtVisitIdentifier:error:](self, "fetchTransitionMOsEndingAtVisitIdentifier:error:", v18, &v60);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v60;

        v49 = v19;
        if (v20)
        {
          *a5 = objc_retainAutorelease(v20);
          v21 = 1;
        }
        else
        {
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v22 = v19;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v57;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v57 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                objc_msgSend(v17, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setVisitIdentifierDestination:", v28);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
            }
            while (v24);
          }

          objc_msgSend(v50, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          self = v47;
          -[RTRelabelerPersister fetchTransitionMOsOriginatingFromVisitIdentifier:error:](v47, "fetchTransitionMOsOriginatingFromVisitIdentifier:error:", v29, &v55);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v55;

          if (v31)
          {
            a5 = v45;
            *v45 = objc_retainAutorelease(v31);
            v21 = 1;
          }
          else
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v32 = v30;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v52;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v52 != v35)
                    objc_enumerationMutation(v32);
                  objc_msgSend(v10, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
              }
              while (v34);
            }

            objc_msgSend(v10, "deleteObject:", v50);
            v21 = 0;
            a5 = v45;
            self = v47;
          }
          v13 = v44;

          v12 = v46;
        }

        if (v21)
        {
          v37 = 0;
          goto LABEL_40;
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      if (v12)
        continue;
      break;
    }
    v37 = 1;
LABEL_40:
    v8 = v43;
  }
  else
  {
    v37 = 1;
  }

LABEL_47:
  return v37;
}

- (BOOL)combineSequentialVisitsWithError:(id *)a3
{
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  _QWORD v13[4];
  id v14[2];
  id location;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__RTRelabelerPersister_combineSequentialVisitsWithError___block_invoke;
    v13[3] = &unk_1E92A0170;
    objc_copyWeak(v14, &location);
    v14[1] = (id)a2;
    v6 = (void *)MEMORY[0x1D8232094](v13);
    v12 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v12);
    v7 = v12;
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "relabeling merged sequential visits with error, %@", buf, 0xCu);
    }

    v9 = v7 == 0;
    if (v7)
    {
      -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v7);
      -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("mergingSequentialVisitsErroredOut"));
      *a3 = objc_retainAutorelease(v7);
    }

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v9;
}

void __57__RTRelabelerPersister_combineSequentialVisitsWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  _QWORD *v54;
  id obj;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *context;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  uint64_t v72;
  const __CFString *v73;
  _BYTE v74[128];
  void *v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  uint64_t v81;
  _QWORD v82[4];

  v82[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v54 = a3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setReturnsObjectsAsFaults:", 1);
      objc_msgSend(v7, "setFetchBatchSize:", 1);
      v71 = 0;
      v52 = v7;
      objc_msgSend(v7, "execute:", &v71);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v71;
      if (v9)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v78 = v49;
          v79 = 2112;
          v80 = v9;
          _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        *v54 = objc_retainAutorelease(v9);
      }
      else
      {
        v51 = v5;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        obj = v8;
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        if (v58)
        {
          v57 = *(_QWORD *)v68;
          v53 = *MEMORY[0x1E0CB2D50];
          v56 = v8;
          v61 = v18;
          while (2)
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v68 != v57)
                objc_enumerationMutation(obj);
              v59 = v19;
              v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
              context = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v20, "visits");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "array");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("entryDate"), 1);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v23;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "sortedArrayUsingDescriptors:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v26 = v25;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
              if (v27)
              {
                v28 = v27;
                v29 = 0;
                v30 = *(_QWORD *)v64;
                while (2)
                {
                  v31 = 0;
                  v32 = v29;
                  do
                  {
                    if (*(_QWORD *)v64 != v30)
                      objc_enumerationMutation(v26);
                    v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v31);
                    if (v32)
                    {
                      objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v31), "entryDate");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "exitDate");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "timeIntervalSinceDate:", v34);
                      v36 = v35;
                      objc_msgSend(WeakRetained, "relabelerPersisterParameters");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "visitAdjacencyMergeThreshold");
                      v39 = v38 * 60.0;

                      if (v36 < v39)
                      {
                        v62 = 0;
                        objc_msgSend(WeakRetained, "combineEarlierVisitMO:withLaterVisitMO:error:", v32, v29, &v62);
                        v40 = v62;
                        if (v40)
                        {
                          v45 = v40;
                          goto LABEL_33;
                        }
                        v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", v32, v29);
                        if (!v41)
                        {
                          v46 = (void *)MEMORY[0x1E0CB35C8];
                          v72 = v53;
                          v73 = CFSTR("combinedPair was nil");
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
                          v47 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("RTRelabelerPersisterErrorDomain"), 0, v47);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();

                          goto LABEL_33;
                        }
                        v42 = (void *)v41;
                        objc_msgSend(v61, "addObject:", v41);

                      }
                      v43 = v29;

                    }
                    else
                    {
                      v44 = v29;
                    }
                    ++v31;
                    v32 = v29;
                  }
                  while (v28 != v31);
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
                  if (v28)
                    continue;
                  break;
                }
                v45 = 0;
                v32 = v29;
LABEL_33:

                v9 = 0;
                v8 = v56;
              }
              else
              {
                v45 = 0;
              }
              v18 = v61;

              objc_autoreleasePoolPop(context);
              if (v45)
              {

                v48 = objc_retainAutorelease(v45);
                *v54 = v48;

                v5 = v51;
                goto LABEL_39;
              }
              v19 = v59 + 1;
            }
            while (v59 + 1 != v58);
            v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
            if (v58)
              continue;
            break;
          }
        }

        v5 = v51;
        objc_msgSend(WeakRetained, "cleanUpCombinedPairs:context:error:", v18, v51, v54);
LABEL_39:

      }
      v17 = v52;
    }
    else
    {
      v11 = v5;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D18598];
      v81 = *MEMORY[0x1E0CB2D50];
      v82[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v78 = v50;
        v79 = 2112;
        v80 = v15;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v17 = objc_retainAutorelease(v15);
      *v54 = v17;
      v5 = v11;
    }

  }
}

- (BOOL)fixUnconcreteLOIs:(id *)a3
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  _QWORD v12[4];
  id v13[2];
  id location;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__RTRelabelerPersister_fixUnconcreteLOIs___block_invoke;
  v12[3] = &unk_1E92A0170;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  v6 = (void *)MEMORY[0x1D8232094](v12);
  v11 = 0;
  -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v11);
  v7 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, fixing unconcrete with error, %@", buf, 0x16u);

  }
  if (v7)
  {
    -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v7);
    -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("fixingUnconcreteErroredOut"));
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v7 == 0;
}

void __42__RTRelabelerPersister_fixUnconcreteLOIs___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setReturnsObjectsAsFaults:", 1);
      objc_msgSend(v6, "setFetchBatchSize:", 1);
      v38 = 0;
      objc_msgSend(v6, "execute:", &v38);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v38;
      if (v8)
      {
        _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v26;
          v43 = 2112;
          v44 = v8;
          _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        *a3 = objc_retainAutorelease(v8);
      }
      else
      {
        v28 = v7;
        v29 = v6;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              if (objc_msgSend(WeakRetained, "unconcreteLOIMO:", v20))
              {
                v32 = 0u;
                v33 = 0u;
                v30 = 0u;
                v31 = 0u;
                objc_msgSend(v20, "visits");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v31;
                  do
                  {
                    for (j = 0; j != v23; ++j)
                    {
                      if (*(_QWORD *)v31 != v24)
                        objc_enumerationMutation(v21);
                      objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "setLocationOfInterestSource:", &unk_1E9328478);
                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
                  }
                  while (v23);
                }

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
          }
          while (v17);
        }

        v7 = v28;
        v6 = v29;
        v8 = 0;
      }

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D18598];
      v45 = *MEMORY[0x1E0CB2D50];
      v46[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v27;
        v43 = 2112;
        v44 = v13;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v6 = objc_retainAutorelease(v13);
      *a3 = v6;
    }

  }
}

- (id)filteredVisitMOs:(id)a3 referenceMapItem:(id)a4 referencePlaceType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  const __CFString *v65;
  id v66;
  NSObject *v67;
  id *v69;
  id v70;
  unint64_t v71;
  void *v72;
  id obj;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  RTRelabelerPersister *v77;
  void *v78;
  void *context;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[16];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    v62 = 0;
    goto LABEL_34;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitMOs", buf, 2u);
    }

    v65 = CFSTR("visitMOs");
    goto LABEL_33;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceMapItem", buf, 2u);
    }

    v65 = CFSTR("referenceMapItem");
LABEL_33:
    _RTErrorInvalidParameterCreate((uint64_t)v65);
    v62 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v77 = self;
  v69 = a6;
  v13 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v12, "latitude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v12, "longitude");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v12, "uncertainty");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  v72 = v12;
  objc_msgSend(v12, "referenceFrame");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v23, "intValue"), v16, v19, v22);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v70 = v10;
  obj = v10;
  v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v76)
  {
    v75 = *(_QWORD *)v83;
    v71 = a5 & 0xFFFFFFFFFFFFFFFELL;
LABEL_6:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v83 != v75)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v24);
      context = (void *)MEMORY[0x1D8231EA8]();
      v80 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v25, "locationLatitude");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;
      objc_msgSend(v25, "locationLongitude");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v30;
      objc_msgSend(v25, "locationHorizontalUncertainty");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValue");
      v34 = v33;
      objc_msgSend(v25, "locationAltitude");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      v37 = v36;
      objc_msgSend(v25, "locationVerticalUncertainty");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v40 = v39;
      objc_msgSend(v25, "locationReferenceFrame");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "intValue");
      objc_msgSend(v25, "locationSourceAccuracy");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v80, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, v42, (int)objc_msgSend(v43, "intValue"), v28, v31, v34, v37, v40, 0.0);

      -[RTRelabelerPersister distanceCalculator](v77, "distanceCalculator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      objc_msgSend(v45, "distanceFromLocation:toLocation:error:", v44, v78, &v81);
      v47 = v46;
      v48 = v81;

      if (v48)
      {

        objc_autoreleasePoolPop(context);
        v66 = objc_retainAutorelease(v48);
        *v69 = v66;

        v62 = 0;
        v12 = v72;
        v61 = v74;
        goto LABEL_29;
      }
      -[RTRelabelerPersister learnedPlaceParameters](v77, "learnedPlaceParameters");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "softDistanceThreshold");
      v51 = v50;

      if (v47 >= v51)
      {
        -[RTRelabelerPersister learnedPlaceParameters](v77, "learnedPlaceParameters");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "softDistanceThreshold");
        if (v47 <= v53)
          goto LABEL_18;
        -[RTRelabelerPersister learnedPlaceParameters](v77, "learnedPlaceParameters");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "softDistanceThreshold");
        if (v47 >= v55 + v55)
        {

LABEL_18:
          goto LABEL_19;
        }
        objc_msgSend(v25, "locationOfInterest");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "mapItem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "name");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v58, "isEqualToString:", v59);

        if (v71 != 2 || !v60)
          goto LABEL_19;
      }
      objc_msgSend(v74, "addObject:", v25);
LABEL_19:

      objc_autoreleasePoolPop(context);
      if (v76 == ++v24)
      {
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
        if (v76)
          goto LABEL_6;
        break;
      }
    }
  }

  v61 = v74;
  v62 = v74;
  v12 = v72;
LABEL_29:

  v10 = v70;
LABEL_34:

  return v62;
}

- (BOOL)consolidateVisitsToLoisWithKnownPlaceTypesWithError:(id *)a3
{
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16[2];
  id location;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__RTRelabelerPersister_consolidateVisitsToLoisWithKnownPlaceTypesWithError___block_invoke;
    v15[3] = &unk_1E92A0170;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a2;
    v6 = (void *)MEMORY[0x1D8232094](v15);
    v14 = 0;
    -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v14);
    v7 = v14;
    v8 = v7 == 0;
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, collapseError, %@", buf, 0x16u);

      }
      *a3 = objc_retainAutorelease(v7);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "relabeling collapsed known place LOIs successfully", buf, 2u);
      }

    }
    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    return 0;
  }
  return v8;
}

void __76__RTRelabelerPersister_consolidateVisitsToLoisWithKnownPlaceTypesWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  _QWORD *v61;
  id v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  void *v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;
  _QWORD v92[4];

  v92[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v61 = a3;
      v62 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v7 = objc_msgSend(&unk_1E932C7A8, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      v66 = WeakRetained;
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v81;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v81 != v9)
              objc_enumerationMutation(&unk_1E932C7A8);
            v11 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i);
            +[RTLearnedLocationOfInterestMO fetchRequest](RTLearnedLocationOfInterestMO, "fetchRequest");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("placeType"), v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setPredicate:", v13);

            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("placeType"), 0);
            v85 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setSortDescriptors:", v15);

            v79 = 0;
            objc_msgSend(v12, "execute:", &v79);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v79;
            if (v17)
            {
              v53 = objc_retainAutorelease(v17);
              *a3 = v53;

              goto LABEL_32;
            }
            objc_msgSend(v70, "addObjectsFromArray:", v16);

          }
          v8 = objc_msgSend(&unk_1E932C7A8, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
          if (v8)
            continue;
          break;
        }
      }
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      obj = v70;
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      v18 = 0;
      if (v65)
      {
        v64 = *(_QWORD *)v76;
LABEL_13:
        v19 = 0;
        while (1)
        {
          v69 = v18;
          if (*(_QWORD *)v76 != v64)
            objc_enumerationMutation(obj);
          v67 = v19;
          v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v19);
          v68 = MEMORY[0x1D8231EA8]();
          v21 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v20, "mapItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "latitude");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;
          objc_msgSend(v20, "mapItem");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "longitude");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v29 = v28;
          objc_msgSend(v20, "mapItem");
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v30, "uncertainty");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v32;
          objc_msgSend(v20, "mapItem");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "referenceFrame");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v21, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v35, "intValue"), v25, v29, v33);

          +[RTLearnedLocationOfInterestVisitMO fetchRequest](RTLearnedLocationOfInterestVisitMO, "fetchRequest");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "learnedPlaceParameters");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "softDistanceThreshold");
          v74 = 0;
          v39 = (void *)v36;
          LOBYTE(v30) = objc_msgSend(v37, "setupBoundingBoxFetchRequestForLocation:distance:entityCanBeLocationShifted:locationShifter:resultExpansionPredicates:resultFilteringPredicates:error:", v36, 0, 0, 0, 0, &v74);
          v40 = v74;

          if ((v30 & 1) != 0)
          {
            objc_msgSend(v37, "setFetchBatchSize:", 10);
            v73 = 0;
            objc_msgSend(v37, "execute:", &v73);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v73;
            v43 = v42;
            if (v42)
            {
              v18 = v42;
              v45 = (void *)v68;
              v44 = v69;
              v46 = 4;
              v47 = v41;
            }
            else
            {
              objc_msgSend(v20, "mapItem");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "placeType");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v49, "integerValue");
              v72 = 0;
              objc_msgSend(v66, "filteredVisitMOs:referenceMapItem:referencePlaceType:error:", v41, v48, v50, &v72);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v72;

              if (v44)
              {
                v18 = v44;
                v51 = v69;
                v46 = 4;
              }
              else
              {
                v71 = 0;
                objc_msgSend(v66, "moveVisitMOs:toLOIMO:error:", v47, v20, &v71);
                v52 = v71;
                if (v52)
                {
                  v51 = v52;

                  v46 = 4;
                  v18 = v51;
                }
                else
                {
                  v51 = 0;
                  v46 = 0;
                  v18 = v69;
                }
              }
              v45 = (void *)v68;

            }
          }
          else
          {
            v18 = v40;
            v45 = (void *)v68;
            v43 = v69;
            v46 = 4;
          }

          objc_autoreleasePoolPop(v45);
          if (v46)
            break;
          v19 = v67 + 1;
          if (v65 == v67 + 1)
          {
            v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
            if (v65)
              goto LABEL_13;
            break;
          }
        }
      }

      v12 = objc_retainAutorelease(v18);
      *v61 = v12;
LABEL_32:

      v5 = v62;
      v54 = v70;
      WeakRetained = v66;
    }
    else
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0D18598];
      v91 = *MEMORY[0x1E0CB2D50];
      v92[0] = CFSTR("swelf is nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", v56, 0, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = v60;
        v89 = 2112;
        v90 = v58;
        _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v54 = objc_retainAutorelease(v58);
      *a3 = v54;
    }

  }
}

- (BOOL)saveWithError:(id *)a3
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", &__block_literal_global_300, &v11);
  v6 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, save error, %@", buf, 0x16u);

    }
    -[RTRelabelerPersisterMetrics tallyError:](self->_metrics, "tallyError:", v6);
    -[RTRelabelerPersisterMetrics setErrorKey:](self->_metrics, "setErrorKey:", CFSTR("saveErroredOut"));
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "relabeling saved successfully", buf, 2u);
    }

  }
  return v6 == 0;
}

void __38__RTRelabelerPersister_saveWithError___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  id v5;

  v5 = 0;
  objc_msgSend(a2, "save:", &v5);
  v4 = objc_retainAutorelease(v5);
  *a3 = v4;

}

- (void)logLocalStoreWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__RTRelabelerPersister_logLocalStoreWithReason___block_invoke;
  v8[3] = &unk_1E92A0228;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](v8);
  v7 = 0;
  -[RTRelabelerPersister performBlock:error:](self, "performBlock:error:", v6, &v7);

}

void __48__RTRelabelerPersister_logLocalStoreWithReason___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v59 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "start logging local store with reason, %@", buf, 0xCu);
    }

  }
  +[RTLearnedLocationOfInterestMO fetchRequestSortedByCreation](RTLearnedLocationOfInterestMO, "fetchRequestSortedByCreation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 1);
  objc_msgSend(v8, "setFetchBatchSize:", 5);
  v55 = 0;
  objc_msgSend(v8, "execute:", &v55);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v55;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityRelabeling);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = (uint64_t)v10;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "log locations error, %@", buf, 0xCu);
    }

    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    v33 = v9;
    v34 = a1;
    v35 = v8;
    v36 = v5;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v9;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v40)
    {
      v38 = *(_QWORD *)v52;
      v39 = 0;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v52 != v38)
            objc_enumerationMutation(obj);
          +[RTLearnedLocationOfInterest createWithManagedObject:](RTLearnedLocationOfInterest, "createWithManagedObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v14 = objc_claimAutoreleasedReturnValue();
          v41 = v12;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v59 = ++v39;
            v60 = 2112;
            v61 = v13;
            _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "locationOfInterest %lu, %@", buf, 0x16u);
          }

          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v42 = v13;
          objc_msgSend(v13, "visits");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v16)
          {
            v17 = v16;
            v18 = 0;
            v19 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v48 != v19)
                  objc_enumerationMutation(v15);
                v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  ++v18;
                  *(_DWORD *)buf = 134218242;
                  v59 = (uint64_t)v18;
                  v60 = 2112;
                  v61 = v21;
                  _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "visit %lu, %@", buf, 0x16u);
                }

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v17);
          }

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v42, "transitions");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v24)
          {
            v25 = v24;
            v26 = 0;
            v27 = *(_QWORD *)v44;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v44 != v27)
                  objc_enumerationMutation(v23);
                v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  ++v26;
                  *(_DWORD *)buf = 134218242;
                  v59 = (uint64_t)v26;
                  v60 = 2112;
                  v61 = v29;
                  _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "transition %lu, %@", buf, 0x16u);
                }

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
            }
            while (v25);
          }

          v12 = v41 + 1;
        }
        while (v41 + 1 != v40);
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v40);
    }

    v8 = v35;
    v5 = v36;
    v10 = 0;
    v9 = v33;
    if (*(_QWORD *)(v34 + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = *(_QWORD *)(v34 + 32);
        *(_DWORD *)buf = 138412290;
        v59 = v32;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "end logging local store with reason, %@", buf, 0xCu);
      }

    }
  }

}

- (RTRelabelerPersisterMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (RTMapItemProviderReverseGeocode)reverseGeocodeProvider
{
  return self->_reverseGeocodeProvider;
}

- (RTMapItemProviderLearnedPlaceParameters)learnedPlaceParameters
{
  return self->_learnedPlaceParameters;
}

- (NSMutableDictionary)loiIdentifierToUnconcreteMap
{
  return self->_loiIdentifierToUnconcreteMap;
}

- (RTRelabelerParameters)relabelerParameters
{
  return self->_relabelerParameters;
}

- (RTRelabelerPersisterParameters)relabelerPersisterParameters
{
  return self->_relabelerPersisterParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relabelerPersisterParameters, 0);
  objc_storeStrong((id *)&self->_relabelerParameters, 0);
  objc_storeStrong((id *)&self->_loiIdentifierToUnconcreteMap, 0);
  objc_storeStrong((id *)&self->_learnedPlaceParameters, 0);
  objc_storeStrong((id *)&self->_reverseGeocodeProvider, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
