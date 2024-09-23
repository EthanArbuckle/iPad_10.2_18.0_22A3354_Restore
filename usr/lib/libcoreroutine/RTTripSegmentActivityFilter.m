@implementation RTTripSegmentActivityFilter

+ (BOOL)isRealModeOfTransportation:(unint64_t)a3
{
  return a3 - 2 < 4;
}

- (id)mergeRepeatedActivities:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0D18400]);
        if (objc_msgSend(v9, "type") == 3)
          v11 = 2;
        else
          v11 = objc_msgSend(v9, "type");
        v12 = objc_msgSend(v9, "confidence");
        objc_msgSend(v9, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v10, "initWithType:confidence:startDate:", v11, v12, v13);

        if (!objc_msgSend(v4, "count")
          || (objc_msgSend(v4, "lastObject"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "type"),
              v17 = objc_msgSend(v14, "type"),
              v15,
              v16 != v17))
        {
          objc_msgSend(v4, "addObject:", v14);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)findIndicesAndDurationForMode:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  __objc2_class **p_superclass;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __objc2_class **v21;
  void *v22;
  double v23;
  void *v24;
  unint64_t v27;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v10 = 1;
    p_superclass = &OBJC_METACLASS___RTWorkoutSchedulerMetricsTask.superclass;
    v27 = a3;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "type") == a3)
      {
        objc_msgSend(v8, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v16 = v15;

        if (v10 - 1 < objc_msgSend(v7, "count") - 1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "startDate");
          v19 = v9;
          v20 = v8;
          v21 = p_superclass;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v22);
          v16 = v23;

          p_superclass = v21;
          v8 = v20;
          v9 = v19;
          a3 = v27;

        }
        v24 = (void *)objc_msgSend(objc_alloc((Class)(p_superclass + 114)), "initWithType:index:duration:", a3, v10 - 1, v16);
        objc_msgSend(v9, "addObject:", v24);

      }
    }
    while (v10++ < objc_msgSend(v7, "count"));
  }

  return v9;
}

- (id)forceActivities:(id)a3 toTransportationMode:(unint64_t)a4 dateInterval:(id)a5
{
  id v7;
  id v8;
  unint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    for (i = 0; i < objc_msgSend(v7, "count"); ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isBeforeDate:", v12);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v10, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isAfterDate:", v15);

        if ((v16 & 1) != 0)
        {

          break;
        }
        if (objc_msgSend(v10, "type") != a4)
        {
          v17 = objc_alloc(MEMORY[0x1E0D18400]);
          v18 = objc_msgSend(v10, "confidence");
          objc_msgSend(v10, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithType:confidence:startDate:", a4, v18, v19);

          objc_msgSend(v7, "replaceObjectAtIndex:withObject:", i, v20);
        }
      }

    }
  }

  return v7;
}

- (id)preventDirectModeSwitchingInActivities:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  BOOL v20;
  _BOOL4 v21;
  uint64_t v22;
  _BOOL4 v23;
  BOOL v24;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v8 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v5, "count"))
      {
        v10 = v9;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", v8);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      objc_msgSend(v10, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v8 - 1 == objc_msgSend(v5, "count") - 1)
      {
        objc_msgSend(v6, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v17);
        v15 = v18;

      }
      if (v7 <= 6)
      {
        if (((1 << v7) & 0x4F) != 0)
          goto LABEL_10;
        v19 = objc_msgSend(v9, "type");
        v20 = v15 < 10.0 && v19 == 6;
        v21 = v20;
        v22 = objc_msgSend(v9, "type");
        v23 = v22 == 5;
        v24 = v15 < 60.0 && v22 == 4;
        v25 = v24;
        if (v7 == 5)
          v23 = 0;
        else
          v25 = 0;
        if (v21 || v25 || v23)
        {
          v26 = objc_alloc(MEMORY[0x1E0D18400]);
          v27 = objc_msgSend(v9, "confidence");
          objc_msgSend(v9, "startDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v26, "initWithType:confidence:startDate:", v7, v27, v28);

          objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v8 - 1, v29);
        }
        else
        {
LABEL_10:
          v7 = objc_msgSend(v9, "type");
        }
      }

    }
    while (v8++ < objc_msgSend(v5, "count"));
  }
  -[RTTripSegmentActivityFilter mergeRepeatedActivities:](self, "mergeRepeatedActivities:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)discardFalseTransitionsFromActivities:(id)a3 whileInTransportMode:(unint64_t)a4 dateInterval:(id)a5 withTimeCushion:(double)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  double v20;
  double v21;
  NSObject *v22;
  unint64_t v23;
  double v24;
  double v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  int v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  RTTripSegmentActivityFilter *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v62 = self;
  -[RTTripSegmentActivityFilter findIndicesAndDurationForMode:activities:dateInterval:](self, "findIndicesAndDurationForMode:activities:dateInterval:", a4, v10, v11);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (!v65)
    goto LABEL_45;
  v13 = 0;
  v66 = *(_QWORD *)v69;
  v61 = a4;
  if (a4 == 4)
    v14 = 0.0;
  else
    v14 = 60.0;
  v64 = v12;
  v63 = v11;
  while (2)
  {
    for (i = 0; i != v65; ++i)
    {
      if (*(_QWORD *)v69 != v66)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      v17 = objc_msgSend(v16, "index");
      if (v17 == objc_msgSend(v10, "count") - 1)
      {
        v11 = v63;
        goto LABEL_45;
      }
      v18 = objc_msgSend(v16, "index");
      if (v18 >= objc_msgSend(v10, "count"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v53 = objc_msgSend(v16, "index");
          v54 = objc_msgSend(v10, "count");
          *(_DWORD *)buf = 134218240;
          v73 = v53;
          v74 = 2048;
          v75 = v54;
          _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity index beyond valid scope,index,%tu,activityCount,%tu", buf, 0x16u);
        }
        v11 = v63;
        goto LABEL_44;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v16, "index"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "duration");
      v21 = v20;
      v67 = v19;
      if (v13 + i < (unint64_t)(objc_msgSend(v12, "count") - 1))
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v13 + i + 1);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = -[NSObject index](v22, "index");
        if (v23 >= objc_msgSend(v10, "count"))
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v55 = objc_msgSend(v16, "index");
            v56 = objc_msgSend(v10, "count");
            *(_DWORD *)buf = 134218240;
            v73 = v55;
            v74 = 2048;
            v75 = v56;
            _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: next activity index beyond valid scope,index,%tu,activityCount,%tu", buf, 0x16u);
          }
          v11 = v63;
        }
        else
        {
          -[NSObject duration](v22, "duration");
          v25 = v24;
          objc_msgSend(v10, "objectAtIndexedSubscript:", -[NSObject index](v22, "index"));
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = -[NSObject index](v22, "index");
          v28 = objc_msgSend(v10, "count");
          -[NSObject startDate](v67, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject startDate](v26, "startDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isBeforeDate:", v30);

          if ((v31 & 1) != 0)
          {
            v32 = v27 == v28 - 1;
            v33 = objc_alloc(MEMORY[0x1E0CB3588]);
            -[NSObject startDate](v67, "startDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject startDate](v26, "startDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v33, "initWithStartDate:endDate:", v34, v35);

            goto LABEL_17;
          }
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject startDate](v67, "startDate");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject startDate](v26, "startDate");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v73 = (uint64_t)v59;
            v74 = 2112;
            v75 = (uint64_t)v60;
            _os_log_debug_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity date, %@, after next activity date, %@", buf, 0x16u);

          }
          v11 = v63;
          v12 = v64;
        }

        v19 = v67;
        goto LABEL_43;
      }
      v11 = v63;
      objc_msgSend(v63, "duration");
      v25 = v37;
      -[NSObject startDate](v19, "startDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "endDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "isBeforeDate:", v39);

      if (!v40)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject startDate](v19, "startDate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "endDate");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v73 = (uint64_t)v57;
          v74 = 2112;
          v75 = (uint64_t)v58;
          _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "RTTripSegmentActivityFilter: current activity date, %@, after transition end date, %@", buf, 0x16u);

        }
        v12 = v64;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      v41 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[NSObject startDate](v19, "startDate");
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v41, "initWithStartDate:endDate:", v22, v34);
      v26 = 0;
      v32 = 0;
LABEL_17:

      v42 = v25 > v14 || v32;
      v12 = v64;
      if (v42 == 1 && v21 > v14)
      {
        objc_msgSend(v36, "duration");
        if (v43 - v21 < a6)
        {
          -[RTTripSegmentActivityFilter forceActivities:toTransportationMode:dateInterval:](v62, "forceActivities:toTransportationMode:dateInterval:", v10, v61, v36);
          v44 = objc_claimAutoreleasedReturnValue();

          if (v13 + i < (unint64_t)(objc_msgSend(v64, "count") - 1))
          {
            -[NSObject startDate](v26, "startDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject startDate](v67, "startDate");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "timeIntervalSinceDate:", v46);
            v48 = v25 + v47;

            objc_msgSend(v64, "objectAtIndexedSubscript:", v13 + i + 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setDuration:", v48);

          }
          v10 = (id)v44;
        }
      }

    }
    v13 += i;
    v11 = v63;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    if (v65)
      continue;
    break;
  }
LABEL_45:

  -[RTTripSegmentActivityFilter mergeRepeatedActivities:](v62, "mergeRepeatedActivities:", v10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (id)discardTrivialActivitiesBetweenIdenticalRealActivities:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "type")))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8 + v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v8 += v10;
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v5, 1);
  v13 = objc_msgSend(v4, "count");
  v14 = v13 - 1;
  if (v13 != 1)
  {
    for (i = v13; i != 1; v14 = i - 1)
    {
      v16 = i;
      i = v14;
      objc_msgSend(v4, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntValue");

      objc_msgSend(v4, "objectAtIndexedSubscript:", v16 - 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue");

      objc_msgSend(v12, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "type");
      objc_msgSend(v12, "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "type");

      v25 = v18 - 1;
      if (v22 == v24 && v25 > v20)
      {
        do
          objc_msgSend(v12, "removeObjectAtIndex:", v25--);
        while (v25 > v20);
      }
    }
  }
  -[RTTripSegmentActivityFilter mergeRepeatedActivities:](self, "mergeRepeatedActivities:", v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (double)findTotalDurationForActivity:(unint64_t)a3 activities:(id)a4 dateInterval:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[RTTripSegmentActivityFilter findIndicesAndDurationForMode:activities:dateInterval:](self, "findIndicesAndDurationForMode:activities:dateInterval:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "duration");
        v9 = v9 + v11;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)findGapMergeOrderFromActivities:(id)a3 dateInterval:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(&unk_1E932CCA0, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(&unk_1E932CCA0);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTripSegmentActivityFilter findTotalDurationForActivity:activities:dateInterval:](self, "findTotalDurationForActivity:activities:dateInterval:", (int)objc_msgSend(v11, "intValue"), v24, v23);
        v13 = v12;

        v30[0] = CFSTR("type");
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v14;
        v30[1] = CFSTR("maxGap");
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxGap"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v15;
        v30[2] = CFSTR("duration");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "addObject:", v17);
      }
      v7 = objc_msgSend(&unk_1E932CCA0, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v7);
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("duration"), 0);
  v29 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)removeFalseTransitionsFromActivities:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  float v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[RTTripSegmentActivityFilter mergeRepeatedActivities:](self, "mergeRepeatedActivities:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentActivityFilter preventDirectModeSwitchingInActivities:dateInterval:](self, "preventDirectModeSwitchingInActivities:dateInterval:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTripSegmentActivityFilter discardTrivialActivitiesBetweenIdenticalRealActivities:](self, "discardTrivialActivitiesBetweenIdenticalRealActivities:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTripSegmentActivityFilter findGapMergeOrderFromActivities:dateInterval:](self, "findGapMergeOrderFromActivities:dateInterval:", v10, v7);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      v15 = v10;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (int)objc_msgSend(v17, "intValue");
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("maxGap"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        -[RTTripSegmentActivityFilter discardFalseTransitionsFromActivities:whileInTransportMode:dateInterval:withTimeCushion:](self, "discardFalseTransitionsFromActivities:whileInTransportMode:dateInterval:withTimeCushion:", v15, v18, v7, v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v10;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  return v10;
}

- (id)forceActivities:(id)a3 withinTransitionInterval:(id)a4 toAutoByConnection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = a4;
  v8 = a5;
  v33 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v10 = 0;
    v34 = v9;
    v35 = v8;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");

      if (v12 != 4)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == objc_msgSend(v9, "count") - 1)
        {
          objc_msgSend(v36, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v10 + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v17 = v8;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v38 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v22, "endDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v14, "isBeforeDate:", v23) & 1) != 0)
              {
                objc_msgSend(v22, "startDate");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v15, "isAfterDate:", v24);

                if ((v25 & 1) != 0)
                {

                  v9 = v34;
                  objc_msgSend(v34, "objectAtIndexedSubscript:", v10);
                  v17 = (id)objc_claimAutoreleasedReturnValue();
                  v26 = objc_alloc(MEMORY[0x1E0D18400]);
                  v27 = objc_msgSend(v17, "confidence");
                  objc_msgSend(v17, "startDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = (void *)objc_msgSend(v26, "initWithType:confidence:startDate:", 4, v27, v28);

                  objc_msgSend(v34, "replaceObjectAtIndex:withObject:", v10, v29);
                  v8 = v35;
                  goto LABEL_20;
                }
              }
              else
              {

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v19);
          v9 = v34;
          v8 = v35;
        }
LABEL_20:

      }
      ++v10;
    }
    while (v10 < objc_msgSend(v9, "count"));
  }
  -[RTTripSegmentActivityFilter mergeRepeatedActivities:](self, "mergeRepeatedActivities:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)isRealModeOfTransportationExisted:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "type", (_QWORD)v9)))
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)populatePredominantActivity:(id)a3 dateInterval:(id)a4 predominantActivityType:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id i;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  for (i = (id)v10; objc_msgSend(i, "count"); objc_msgSend(i, "removeObjectAtIndex:", 0))
  {
    objc_msgSend(i, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(v12, "type"));

    if (v13)
      break;
  }
  while (objc_msgSend(i, "count"))
  {
    objc_msgSend(i, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(v14, "type"));

    if (v15)
      break;
    objc_msgSend(i, "removeLastObject");
  }
  if (-[RTTripSegmentActivityFilter isRealModeOfTransportationExisted:](self, "isRealModeOfTransportationExisted:", i))
    goto LABEL_18;
  if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", a5))
  {
    if (i)
    {
      objc_msgSend(i, "removeAllObjects");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      i = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_alloc(MEMORY[0x1E0D18400]);
    objc_msgSend(v9, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithType:confidence:startDate:", a5, 3, v18);

    objc_msgSend(i, "addObject:", v19);
LABEL_18:
    i = i;
    v16 = i;
    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (id)removeNonTransportationModeActivities:(id)a3 dateInterval:(id)a4 vehicleIntervals:(id)a5 predominantActivityType:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  RTTripSegmentActivityFilter *v86;
  id v87;
  id obja;
  id obj;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", v10, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (objc_msgSend(v13, "count"))
  {
    -[RTTripSegmentActivityFilter forceActivities:withinTransitionInterval:toAutoByConnection:](self, "forceActivities:withinTransitionInterval:toAutoByConnection:", v14, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  -[RTTripSegmentActivityFilter populatePredominantActivity:dateInterval:predominantActivityType:](self, "populatePredominantActivity:dateInterval:predominantActivityType:", v14, v11, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v84 = v11;
    v85 = v10;
    v83 = v12;
    v86 = self;
    if (objc_msgSend(v16, "count"))
    {
      -[RTTripSegmentActivityFilter removeFalseTransitionsFromActivities:dateInterval:predominantActivityType:](self, "removeFalseTransitionsFromActivities:dateInterval:predominantActivityType:", v16, v11, a6);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v82 = v16;
    objc_msgSend(v16, "reverseObjectEnumerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v97 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
          if (objc_msgSend(v18, "count")
            && ((objc_msgSend(v18, "firstObject"),
                 v25 = (void *)objc_claimAutoreleasedReturnValue(),
                 v26 = objc_msgSend(v25, "type"),
                 v25,
                 !objc_msgSend(v24, "type"))
             || objc_msgSend(v24, "type") == 6)
            && +[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", v26))
          {
            v27 = objc_alloc(MEMORY[0x1E0D18400]);
            v28 = objc_msgSend(v24, "confidence");
            objc_msgSend(v24, "startDate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v27, "initWithType:confidence:startDate:", v26, v28, v29);

            objc_msgSend(v18, "insertObject:atIndex:", v30, 0);
          }
          else
          {
            objc_msgSend(v18, "insertObject:atIndex:", v24, 0);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      }
      while (v21);
    }

    -[RTTripSegmentActivityFilter mergeRepeatedActivities:](v86, "mergeRepeatedActivities:", v18);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __123__RTTripSegmentActivityFilter_removeNonTransportationModeActivities_dateInterval_vehicleIntervals_predominantActivityType___block_invoke;
    v94[3] = &unk_1E92A54F8;
    v33 = v32;
    v95 = v33;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v94);
    v87 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v33, "count") != 1)
    {
      v34 = 0;
      do
      {
        objc_msgSend(v33, "objectAtIndexedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntValue");

        objc_msgSend(v33, "objectAtIndexedSubscript:", ++v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "unsignedIntValue");

        objc_msgSend(v31, "objectAtIndexedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "addObject:", v39);

        if (v36 + 1 != v38)
        {
          objc_msgSend(v31, "objectAtIndexedSubscript:", v36);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "type");
          objc_msgSend(v31, "objectAtIndexedSubscript:", v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "type");

          if (v41 != v43 && v36 <= v38)
          {
            while (1)
            {
              objc_msgSend(v31, "objectAtIndexedSubscript:", v36);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "type");

              if (v45 == 1)
                break;
              if (v38 + 1 == ++v36)
                goto LABEL_31;
            }
            obja = objc_alloc(MEMORY[0x1E0D18400]);
            objc_msgSend(v31, "objectAtIndexedSubscript:", v38);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "type");
            objc_msgSend(v31, "objectAtIndexedSubscript:", v38);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "confidence");
            objc_msgSend(v31, "objectAtIndexedSubscript:", v36);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "startDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(obja, "initWithType:confidence:startDate:", v47, v49, v51);

            objc_msgSend(v87, "addObject:", v52);
          }
        }
LABEL_31:
        ;
      }
      while (v34 < objc_msgSend(v33, "count") - 1);
    }
    v80 = v33;
    v81 = v31;
    objc_msgSend(v31, "lastObject");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addObject:", v53);

    -[RTTripSegmentActivityFilter mergeRepeatedActivities:](v86, "mergeRepeatedActivities:", v87);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v54;
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v91 != v58)
            objc_enumerationMutation(obj);
          v60 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          if (!objc_msgSend(v55, "count"))
            goto LABEL_40;
          objc_msgSend(v60, "startDate");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "lastObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "startDate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "timeIntervalSinceDate:", v63);
          v65 = v64;

          if (v65 < 30.0)
          {
            v66 = objc_alloc(MEMORY[0x1E0D18400]);
            v67 = objc_msgSend(v60, "type");
            v68 = objc_msgSend(v60, "confidence");
            objc_msgSend(v55, "lastObject");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "startDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = (void *)objc_msgSend(v66, "initWithType:confidence:startDate:", v67, v68, v70);

            objc_msgSend(v55, "removeLastObject");
            objc_msgSend(v55, "addObject:", v71);

          }
          else
          {
LABEL_40:
            objc_msgSend(v55, "addObject:", v60);
          }
        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      }
      while (v57);
    }

    objc_msgSend(v55, "firstObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_alloc(MEMORY[0x1E0D18400]);
    v74 = objc_msgSend(v72, "type");
    v75 = objc_msgSend(v72, "confidence");
    v11 = v84;
    objc_msgSend(v84, "startDate");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v73, "initWithType:confidence:startDate:", v74, v75, v76);

    objc_msgSend(v55, "removeObjectAtIndex:", 0);
    objc_msgSend(v55, "insertObject:atIndex:", v77, 0);

    v10 = v85;
    v78 = v82;
    v12 = v83;
  }
  else
  {
    v78 = v16;
    v55 = v78;
  }

  return v55;
}

void __123__RTTripSegmentActivityFilter_removeNonTransportationModeActivities_dateInterval_vehicleIntervals_predominantActivityType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  if (+[RTTripSegmentActivityFilter isRealModeOfTransportation:](RTTripSegmentActivityFilter, "isRealModeOfTransportation:", objc_msgSend(a2, "type")))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

@end
