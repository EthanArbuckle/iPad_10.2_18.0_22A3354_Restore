@implementation RTLearnedLocation

- (RTLearnedLocation)initWithLocationOfInterest:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  RTLearnedLocation *v25;

  v4 = (objc_class *)MEMORY[0x1E0D183B0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latitude");
  v9 = v8;
  objc_msgSend(v5, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "longitude");
  v12 = v11;
  objc_msgSend(v5, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "horizontalUncertainty");
  v15 = v14;
  objc_msgSend(v5, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "altitude");
  v18 = v17;
  objc_msgSend(v5, "location");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "verticalUncertainty");
  v21 = v20;
  objc_msgSend(v5, "location");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 0, objc_msgSend(v22, "sourceAccuracy"), v9, v12, v15, v18, v21, 0.0);

  objc_msgSend(v5, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](self, "initWithLocation:dataPointCount:type:", v23, objc_msgSend(v24, "sourceAccuracy") == 2, 2);
  return v25;
}

- (RTLearnedLocation)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_dataPointCount_confidence_);
}

- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 confidence:(double)a5
{
  id v9;
  RTLearnedLocation *v10;
  RTLearnedLocation *v11;
  RTLearnedLocation *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTLearnedLocation;
    v10 = -[RTLearnedLocation init](&v15, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_location, a3);
      v11->_dataPointCount = a4;
      v11->_confidence = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[RTLearnedLocation initWithLocation:dataPointCount:confidence:]";
      v18 = 1024;
      v19 = 42;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", buf, 0x12u);
    }

    v12 = 0;
  }

  return v12;
}

- (RTLearnedLocation)initWithLocation:(id)a3 dataPointCount:(unint64_t)a4 type:(unint64_t)a5
{
  id v9;
  NSObject *v10;
  double v11;
  NSObject *v12;
  RTLearnedLocation *v13;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[RTLearnedLocation initWithLocation:dataPointCount:type:]";
      v18 = 1024;
      LODWORD(v19) = 61;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

  }
  if (a5 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v15;
      v18 = 2048;
      v19 = a5;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", (uint8_t *)&v16, 0x16u);

    }
    v11 = 30.0;
  }
  else
  {
    v11 = dbl_1D1EED8F8[a5];
  }
  objc_msgSend((id)objc_opt_class(), "confidenceFromDataPointCount:highConfidenceThreshold:", a4, v11);
  v13 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:](self, "initWithLocation:dataPointCount:confidence:", v9, a4);

  return v13;
}

+ (id)shiftLocation:(id)a3 shifter:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: shifter", v11, 2u);
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "shiftedLocation:allowNetwork:error:", v5, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v8;
}

+ (id)removeLearnedVisitsPinned:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4838400.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3880];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__RTLearnedLocation_removeLearnedVisitsPinned___block_invoke;
    v14[3] = &unk_1E92A0980;
    v15 = v5;
    v7 = v5;
    objc_msgSend(v6, "predicateWithBlock:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v10 = v9;

      v4 = v10;
    }
    v11 = v4;

    v12 = v11;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

uint64_t __47__RTLearnedLocation_removeLearnedVisitsPinned___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earlierDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToDate:", *(_QWORD *)(a1 + 32));

  return v6;
}

+ (id)removeLearnedVisitsInvalid:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v3;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v6)
    {
      v7 = v6;
      v20 = v3;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v10, "location");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "location");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "horizontalUncertainty");
          v14 = v13;

          if (v14 <= -1.0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v27 = v17;
              v28 = 2112;
              v29 = v18;
              v30 = 2112;
              v31 = v10;
              _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "%@, %@, filter invalid visit, %@", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v4, "addObject:", v10);
          }
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v7);
      v3 = v20;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)removeLearnedVisitsWithShortestDwell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "location", (_QWORD)v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "location");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "sourceAccuracy");

          if (v15 == 2)
            v16 = v5;
          else
            v16 = v6;
          objc_msgSend(v16, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    if ((unint64_t)objc_msgSend(v5, "count") >= 5)
    {
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_76);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v17, "subarrayWithRange:", 0, objc_msgSend(v17, "count") - (unint64_t)((double)(unint64_t)objc_msgSend(v17, "count") * 0.2));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "addObjectsFromArray:", v6);
      v7 = v20;
    }
    v21 = v7;

    v22 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedVisits", buf, 2u);
    }
    v22 = 0;
  }

  return v22;
}

uint64_t __58__RTLearnedLocation_removeLearnedVisitsWithShortestDwell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "exitDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  objc_msgSend(v4, "exitDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v9 <= v13)
    v14 = 0;
  else
    v14 = -1;
  if (v9 < v13)
    return 1;
  else
    return v14;
}

+ (id)removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _RTMap *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)objc_msgSend(v4, "count") > 2)
    {
      v8 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v5);
      -[_RTMap withBlock:](v8, "withBlock:", &__block_literal_global_17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", (unint64_t)objc_msgSend(v9, "count") >> 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      v14 = v13 * 3.0;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2048;
        v22 = v14;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, filter locations based on maximum horizonal uncertainty, %.1f", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K <= %f"), CFSTR("location"), CFSTR("horizontalUncertainty"), *(_QWORD *)&v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "filteredArrayUsingPredicate:", v17);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v5;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

id __81__RTLearnedLocation_removeOutlierLearnedLocationsWithLargeHorizontalUncertainty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "horizontalUncertainty");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)calculateAltitude:(double *)a3 verticalUncertainty:(double *)a4 learnedLocations:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double *v10;
  NSObject *v11;
  const char *v12;
  double *v13;
  double v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;

  v7 = a5;
  v8 = v7;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: altitudeEstimation";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_11;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: verticalUncertaintyEstimation";
    goto LABEL_21;
  }
  *a3 = 0.0;
  *a4 = -1.0;
  if (objc_msgSend(v7, "count"))
  {
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x2020000000;
    v37 = 0;
    v30 = 0;
    v31 = (double *)&v30;
    v32 = 0x2020000000;
    v33 = 0xBFF0000000000000;
    v26 = 0;
    v27 = (double *)&v26;
    v28 = 0x2020000000;
    v29 = 0;
    v22 = 0;
    v23 = (double *)&v22;
    v24 = 0x2020000000;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__RTLearnedLocation_calculateAltitude_verticalUncertainty_learnedLocations___block_invoke;
    v17[3] = &unk_1E92A0A28;
    v17[4] = buf;
    v17[5] = &v30;
    v17[6] = &v18;
    v17[7] = &v26;
    v17[8] = &v22;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
    if (*((_BYTE *)v19 + 24))
    {
      v9 = *((double *)v35 + 3);
      v10 = v31;
    }
    else
    {
      v13 = v27;
      v14 = v27[3];
      if (v14 == 0.0 && v23[3] == 0.0)
        goto LABEL_7;
      if (v14 <= 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v16 = 0;
          _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inverseVerticalUncertaintySquaredSum > 0.0", v16, 2u);
        }

        goto LABEL_7;
      }
      v10 = v31;
      v31[3] = sqrt(1.0 / v14);
      v9 = v23[3] / v13[3];
      *((double *)v35 + 3) = v9;
    }
    *a3 = v9;
    *a4 = v10[3];
LABEL_7:
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(buf, 8);
  }
LABEL_12:

}

void __76__RTLearnedLocation_calculateAltitude_verticalUncertainty_learnedLocations___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "altitude");
  v9 = v8;

  objc_msgSend(v6, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verticalUncertainty");
  v12 = v11;

  if (v12 != -1.0)
  {
    if (v12 == 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "this learnedLocation, %@, has zero verticalUncertainty, so it is chosen as the final estimate.", (uint8_t *)&v15, 0xCu);
      }

      *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v9;
      *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v12;
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
    else
    {
      v14 = 1.0 / (v12 * v12);
      *(double *)(*(_QWORD *)(a1[7] + 8) + 24) = v14 + *(double *)(*(_QWORD *)(a1[7] + 8) + 24);
      *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = *(double *)(*(_QWORD *)(a1[8] + 8) + 24) + v9 * v14;
    }
  }

}

- (RTLearnedLocation)initWithLearnedVisits:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _RTMap *v7;
  void *v8;
  void *v9;
  RTLearnedLocation *v10;

  +[RTLearnedLocation removeLearnedVisitsInvalid:](RTLearnedLocation, "removeLearnedVisitsInvalid:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLearnedLocation removeLearnedVisitsPinned:](RTLearnedLocation, "removeLearnedVisitsPinned:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTLearnedLocation removeLearnedVisitsWithShortestDwell:](RTLearnedLocation, "removeLearnedVisitsWithShortestDwell:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v6);
  -[_RTMap withBlock:](v7, "withBlock:", &__block_literal_global_30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTLearnedLocation removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:](RTLearnedLocation, "removeOutlierLearnedLocationsWithLargeHorizontalUncertainty:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTLearnedLocation initWithLearnedLocations:type:](self, "initWithLearnedLocations:type:", v9, 2);

  return v10;
}

uint64_t __43__RTLearnedLocation_initWithLearnedVisits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "location");
}

- (RTLearnedLocation)initWithLearnedLocations:(id)a3 type:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  NSObject *v43;
  void *v44;
  RTLearnedLocation *v45;
  void *v46;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  NSObject *v57;
  RTLearnedLocation *v59;
  void *v60;
  const char *aSelector;
  unint64_t v62;
  id v63;
  RTLearnedLocation *v64;
  NSObject *obj;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  unint64_t v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations.count != 0", buf, 2u);
    }
    goto LABEL_37;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v8 = v7;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
  if (!v9)
  {

LABEL_35:
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v78 = v46;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, data point count was 0", buf, 0xCu);

    }
LABEL_37:
    v45 = 0;
    goto LABEL_38;
  }
  v10 = v9;
  v64 = self;
  obj = v8;
  aSelector = a2;
  v62 = a4;
  v63 = v7;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v73;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v73 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
      objc_msgSend(v16, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "sourceAccuracy");

      objc_msgSend(v16, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "referenceFrame");

      if (v20 == 2)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(aSelector);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v78 = v44;
          v79 = 2112;
          v80 = (unint64_t)v16;
          _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "%@, found China shifted location, %@", buf, 0x16u);

        }
        v21 = obj;
        self = -[RTLearnedLocation initWithChinaShiftedLearnedLocations:type:](v64, "initWithChinaShiftedLearnedLocations:type:", obj, v62);
        v45 = self;
        v7 = v63;
        goto LABEL_38;
      }
      v13 |= v18 == 2;
      if (v18 == 2)
        ++v11;
      v12 += objc_msgSend(v16, "dataPointCount");
    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    if (v10)
      continue;
    break;
  }

  v7 = v63;
  self = v64;
  a2 = aSelector;
  if (!v12)
    goto LABEL_35;
  if ((v13 & (v11 > 2)) == 1)
  {
    -[NSObject count](obj, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v23 = obj;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v69 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v28, "location");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "sourceAccuracy");

          if (v30 == 2)
            v31 = v21;
          else
            v31 = v22;
          -[NSObject addObject:](v31, "addObject:", v28);
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      }
      while (v25);
    }

    -[RTLearnedLocation aggregateLearnedLocations:updateAltitude:](v64, "aggregateLearnedLocations:updateAltitude:", v21, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLearnedLocation aggregateLearnedLocations:updateAltitude:](v64, "aggregateLearnedLocations:updateAltitude:", v22, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "horizontalUncertainty");
    v35 = v34;
    objc_msgSend(v33, "horizontalUncertainty");
    v7 = v63;
    if (v32)
    {
      if (v35 >= v36)
        v37 = v35;
      else
        v37 = v36;
      objc_msgSend(v32, "latitude");
      v39 = v38;
      objc_msgSend(v32, "longitude");
      v41 = v40;
      v42 = v62;
LABEL_47:
      v66 = -1.0;
      v67 = 0.0;
      -[RTLearnedLocation calculateAltitude:verticalUncertainty:learnedLocations:](v64, "calculateAltitude:verticalUncertainty:learnedLocations:", &v67, &v66, v23);
      v55 = objc_alloc(MEMORY[0x1E0D183B0]);
      v56 = (void *)objc_msgSend(v55, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 0, 2, v39, v41, v37, v67, v66, 0.0);
      if (v42 >= 2)
      {
        if (v42 == 2)
        {
          v12 = -[NSObject count](v21, "count");
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v78 = v60;
            v79 = 2048;
            v80 = v42;
            _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", buf, 0x16u);

          }
        }
      }
      v59 = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v64, "initWithLocation:dataPointCount:type:", v56, v12, v42);

      self = v59;
      v45 = v59;
    }
    else
    {
      v42 = v62;
      if (v33)
      {
        objc_msgSend(v33, "latitude");
        v39 = v52;
        objc_msgSend(v33, "longitude");
        v41 = v53;
        objc_msgSend(v33, "horizontalUncertainty");
        v37 = v54;
        goto LABEL_47;
      }
      v45 = 0;
      self = v64;
    }

    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(aSelector);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v78 = v49;
    _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%@, high accurate location was not found", buf, 0xCu);

  }
  -[RTLearnedLocation aggregateLearnedLocations:updateAltitude:](v64, "aggregateLearnedLocations:updateAltitude:", obj, 1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v62 == 2)
  {
    v50 = 0;
    v51 = 2;
  }
  else
  {
    v50 = v12;
    v51 = v62;
  }
  self = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v64, "initWithLocation:dataPointCount:type:", v21, v50, v51);
  v45 = self;
LABEL_38:

  return v45;
}

- (id)aggregateLearnedLocations:(id)a3 updateAltitude:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  RTLearnedLocation *v37;
  _BOOL4 v38;
  double v40;
  double v41;
  double v42;
  double v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v30;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, aggregate zero locations", buf, 0xCu);

    }
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "count"))
  {
    v38 = v4;
    v37 = self;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v10, v37);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = v19;
        v46 = 2048;
        v47 = (void *)(v10 + 1);
        v48 = 2112;
        v49 = v17;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, location %lu, %@", buf, 0x20u);

      }
      if (!v8)
        v8 = v17;
      v20 = objc_msgSend(v17, "sourceAccuracy");
      v42 = 0.0;
      v43 = 0.0;
      v41 = 0.0;
      -[NSObject latitude](v8, "latitude");
      -[NSObject longitude](v8, "longitude");
      objc_msgSend(v17, "latitude");
      objc_msgSend(v17, "longitude");
      if ((RTCommonConvertGeodeticToLocalFrame() & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%@, failed to convert geodetic to local frame", buf, 0xCu);

        }
        goto LABEL_35;
      }
      if (v20 == 2)
        v9 = 2;
      v11 = v11 + (double)(unint64_t)objc_msgSend(v16, "dataPointCount") * v42;
      v12 = v12 + (double)(unint64_t)objc_msgSend(v16, "dataPointCount") * v41;
      v13 = v13 + (double)(unint64_t)objc_msgSend(v16, "dataPointCount") * (v42 * v42);
      v14 = v14 + (double)(unint64_t)objc_msgSend(v16, "dataPointCount") * (v41 * v41);
      v21 = (double)(unint64_t)objc_msgSend(v16, "dataPointCount");
      objc_msgSend(v17, "horizontalUncertainty");
      v15 = v15 + v21 * (v22 * v22);
      v7 += objc_msgSend(v16, "dataPointCount");

      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
    if (!v7)
      goto LABEL_26;
    v42 = 0.0;
    v43 = 0.0;
    -[NSObject latitude](v8, "latitude");
    -[NSObject longitude](v8, "longitude");
    if (RTCommonConvertLocalFrameToGeodetic())
    {
      RTCommonIsCoordinateValid();
      if (v23 != 0.0)
      {
        v24 = sqrt((v14 + v13 + v15 - v11 * v11 / (double)v7 - v12 * v12 / (double)v7) / (double)v7);
        if (v24 >= 5.0)
          v25 = v24;
        else
          v25 = 5.0;
        v40 = -1.0;
        v41 = 0.0;
        if (v38)
          -[RTLearnedLocation calculateAltitude:verticalUncertainty:learnedLocations:](v37, "calculateAltitude:verticalUncertainty:learnedLocations:", &v41, &v40, v6);
        v26 = objc_alloc(MEMORY[0x1E0D183B0]);
        v27 = (void *)objc_msgSend(v26, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 0, v9, v43, v42, v25, v41, v40, 0.0);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = v29;
          v46 = 2112;
          v47 = v27;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, aggregated location, %@", buf, 0x16u);

        }
        goto LABEL_36;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v32;
    v33 = "%@, invalid coordinates converted from local frame";
  }
  else
  {
    v8 = 0;
LABEL_26:
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_34;
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v32;
    v33 = "%@, zero data point count";
  }
  _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, v33, buf, 0xCu);

LABEL_34:
LABEL_35:
  v27 = 0;
LABEL_36:

  return v27;
}

- (RTLearnedLocation)initWithChinaShiftedLearnedLocations:(id)a3 type:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  RTLearnedLocation *v42;
  void *v44;
  unint64_t v45;
  RTLearnedLocation *v46;
  uint64_t v47;
  double v49;
  double v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocations.count != 0", buf, 2u);
    }
    goto LABEL_36;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v7 = 0;
LABEL_36:
    v42 = 0;
    goto LABEL_39;
  }
  v45 = a4;
  v46 = self;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v47 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndex:", v9, v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = v20;
      v53 = 2048;
      v54 = (unint64_t)v9;
      v55 = 2112;
      v56 = v18;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, location %lu, %@", buf, 0x20u);

    }
    objc_msgSend(v17, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "referenceFrame");

    if (v22 == 2)
      goto LABEL_11;
    if (!v7)
      v7 = objc_opt_new();
    +[RTLearnedLocation shiftLocation:shifter:](RTLearnedLocation, "shiftLocation:shifter:", v18, v7);
    v23 = objc_claimAutoreleasedReturnValue();

    if (!v23)
      break;
    v18 = (void *)v23;
LABEL_11:
    if (objc_msgSend(v18, "sourceAccuracy") == 2)
    {
      ++v10;
      v24 = (double)(unint64_t)objc_msgSend(v17, "dataPointCount");
      objc_msgSend(v18, "latitude");
      v15 = v15 + v24 * v25;
      v26 = (double)(unint64_t)objc_msgSend(v17, "dataPointCount");
      objc_msgSend(v18, "longitude");
      v16 = v16 + v26 * v27;
      v11 += objc_msgSend(v17, "dataPointCount");
      v47 = 2;
    }
    v28 = (double)(unint64_t)objc_msgSend(v17, "dataPointCount");
    objc_msgSend(v18, "latitude");
    v12 = v12 + v28 * v29;
    v30 = (double)(unint64_t)objc_msgSend(v17, "dataPointCount");
    objc_msgSend(v18, "longitude");
    v13 = v13 + v30 * v31;
    v32 = (double)(unint64_t)objc_msgSend(v17, "dataPointCount");
    objc_msgSend(v18, "horizontalUncertainty");
    v14 = v14 + v32 * v33;
    v8 += objc_msgSend(v17, "dataPointCount");

    if ((unint64_t)++v9 >= objc_msgSend(v6, "count"))
    {
      if (!v8)
        goto LABEL_38;
      if (v47 == 2)
        v34 = v15 / (double)v11;
      else
        v34 = v12 / (double)v8;
      if (v47 == 2)
        v35 = v16 / (double)v11;
      else
        v35 = v13 / (double)v8;
      if (v14 / (double)v8 >= 5.0)
        v36 = v14 / (double)v8;
      else
        v36 = 5.0;
      v49 = -1.0;
      v50 = 0.0;
      -[RTLearnedLocation calculateAltitude:verticalUncertainty:learnedLocations:](v46, "calculateAltitude:verticalUncertainty:learnedLocations:", &v50, &v49, v6);
      v37 = objc_alloc(MEMORY[0x1E0D183B0]);
      v38 = (void *)objc_msgSend(v37, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", 0, 2, v47, v34, v35, v36, v50, v49, 0.0);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v52 = v40;
        v53 = 2112;
        v54 = (unint64_t)v38;
        _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, aggregated location, %@", buf, 0x16u);

      }
      if (v45 >= 2)
      {
        if (v45 == 2)
        {
LABEL_32:
          self = -[RTLearnedLocation initWithLocation:dataPointCount:type:](v46, "initWithLocation:dataPointCount:type:", v38, v10, v45);

          v42 = self;
          goto LABEL_39;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = v44;
          v53 = 2048;
          v54 = v45;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, unsupported learned location type, %lu", buf, 0x16u);

        }
      }
      v10 = v8;
      goto LABEL_32;
    }
  }

LABEL_38:
  v42 = 0;
  self = v46;
LABEL_39:

  return v42;
}

+ (double)confidenceFromDataPointCount:(unint64_t)a3 highConfidenceThreshold:(double)a4
{
  double v4;
  double v5;

  v4 = 1.0;
  if ((double)a3 < a4)
  {
    v5 = (double)a3 / a4;
    if (v5 <= 1.0)
      return v5;
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLearnedLocation location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTLearnedLocation dataPointCount](self, "dataPointCount");
  -[RTLearnedLocation confidence](self, "confidence");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, dataPointCount, %lu, confidence, %.2f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTLearnedLocation *v5;
  RTLearnedLocation *v6;
  RTLearnedLocation *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  char v18;

  v5 = (RTLearnedLocation *)a3;
  v6 = v5;
  if (v5 == self)
  {
    v12 = 1;
    goto LABEL_19;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  -[RTLearnedLocation location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[RTLearnedLocation location](v7, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  -[RTLearnedLocation location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocation location](v7, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_11;
LABEL_12:

  v13 = -[RTLearnedLocation dataPointCount](self, "dataPointCount");
  v14 = -[RTLearnedLocation dataPointCount](v7, "dataPointCount");
  -[RTLearnedLocation confidence](self, "confidence");
  v16 = v15;
  -[RTLearnedLocation confidence](v7, "confidence");
  if (v13 == v14)
    v18 = v11;
  else
    v18 = 0;
  if (v16 == v17)
    v12 = v18;
  else
    v12 = 0;

LABEL_19:
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[RTLearnedLocation location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocation dataPointCount](self, "dataPointCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedLocation confidence](self, "confidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (RTLocation)location
{
  return self->_location;
}

- (unint64_t)dataPointCount
{
  return self->_dataPointCount;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

- (RTLearnedLocation)initWithMapItem:(id)a3 type:(unint64_t)a4
{
  void *v6;
  RTLearnedLocation *v7;

  objc_msgSend(a3, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[RTLearnedLocation initWithLocation:dataPointCount:type:](self, "initWithLocation:dataPointCount:type:", v6, 0, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
