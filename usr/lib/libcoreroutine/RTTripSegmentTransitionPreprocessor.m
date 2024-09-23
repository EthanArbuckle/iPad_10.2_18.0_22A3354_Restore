@implementation RTTripSegmentTransitionPreprocessor

- (RTTripSegmentTransitionPreprocessor)initWithMotionActivityManager:(id)a3 locationManager:(id)a4 learnedLocationManager:(id)a5 vehicleStore:(id)a6 distanceCalculator:(id)a7 visitManager:(id)a8 elevationAdjuster:(id)a9 defaultsManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  RTTripSegmentTransitionPreprocessor *v19;
  RTTripSegmentTransitionPreprocessor *v20;
  uint64_t v21;
  NSMutableArray *tripSegmentTransitions;
  uint64_t v23;
  NSMutableArray *tripSegmentVisitStatus;
  uint64_t v25;
  NSMutableArray *tripSegmentTransitionStatus;
  uint64_t v27;
  NSMutableDictionary *transitionStartStopLocations;
  RTTripSegmentTransitionPreprocessor *v29;
  RTTripSegmentTransitionPreprocessor *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v37;
  id v38;
  id v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v18 = a10;
  if (!v16)
  {
    v32 = v17;
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: motionActivityManager", buf, 2u);
    }

    v30 = 0;
    goto LABEL_15;
  }
  v39 = v17;
  if (!v17)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: locationManager";
LABEL_28:
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_29;
  }
  if (!v45)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_28;
  }
  if (!v44)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: vehicleStore";
    goto LABEL_28;
  }
  if (!v43)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_28;
  }
  if (!v42)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v35 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_28;
  }
  if (!v41)
  {
    v31 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "Invalid parameter not satisfying: elevationAdjuster";
      goto LABEL_28;
    }
LABEL_29:

    v30 = 0;
    v29 = self;
LABEL_30:
    v32 = v39;
    goto LABEL_31;
  }
  v38 = v18;
  if (v18)
  {
    v46.receiver = self;
    v46.super_class = (Class)RTTripSegmentTransitionPreprocessor;
    v19 = -[RTTripSegmentTransitionPreprocessor init](&v46, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_motionActivityManager, a3);
      objc_storeStrong((id *)&v20->_locationManager, a4);
      objc_storeStrong((id *)&v20->_learnedLocationManager, a5);
      objc_storeStrong((id *)&v20->_vehicleStore, a6);
      objc_storeStrong((id *)&v20->_distanceCalculator, a7);
      objc_storeStrong((id *)&v20->_visitManager, a8);
      objc_storeStrong((id *)&v20->_elevationAdjuster, a9);
      objc_storeStrong((id *)&v20->_defaultsManager, a10);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = objc_claimAutoreleasedReturnValue();
      tripSegmentTransitions = v20->_tripSegmentTransitions;
      v20->_tripSegmentTransitions = (NSMutableArray *)v21;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = objc_claimAutoreleasedReturnValue();
      tripSegmentVisitStatus = v20->_tripSegmentVisitStatus;
      v20->_tripSegmentVisitStatus = (NSMutableArray *)v23;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = objc_claimAutoreleasedReturnValue();
      tripSegmentTransitionStatus = v20->_tripSegmentTransitionStatus;
      v20->_tripSegmentTransitionStatus = (NSMutableArray *)v25;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = objc_claimAutoreleasedReturnValue();
      transitionStartStopLocations = v20->_transitionStartStopLocations;
      v20->_transitionStartStopLocations = (NSMutableDictionary *)v27;

    }
    v29 = v20;
    v30 = v29;
    v31 = v38;
    goto LABEL_30;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  v32 = v17;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
  }

  v30 = 0;
  v31 = 0;
LABEL_15:
  v29 = self;
LABEL_31:

  return v30;
}

- (id)processTransitions:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *tripSegmentTransitions;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  NSMutableArray *tripSegmentTransitionStatus;
  void *v27;
  uint64_t v28;
  NSString *v29;
  SEL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  unint64_t v40;
  NSObject *v41;
  NSMutableArray *tripSegmentVisitStatus;
  void *v43;
  uint64_t v44;
  NSString *v45;
  SEL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  void *v59;
  id v60;
  _QWORD v61[2];
  uint8_t buf[4];
  unint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[7];

  v70[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  tripSegmentTransitions = self->_tripSegmentTransitions;
  self->_tripSegmentTransitions = v5;

  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v55 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
    *(_DWORD *)buf = 134217984;
    v63 = v55;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: processing %tu input transitions", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    do
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v63 = v8;
        v64 = 2112;
        v65 = v10;
        _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor, input transition, %ld, %@", buf, 0x16u);

      }
      ++v8;
    }
    while (v8 < objc_msgSend(v4, "count"));
  }
  if ((unint64_t)-[NSMutableArray count](self->_tripSegmentTransitions, "count") >= 2)
  {
    v60 = v4;
    NSStringFromSelector(sel_applyRule_LoiVisitsAreValid_ForVisitAtIndex_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v13;
    NSStringFromSelector(sel_applyRule_LongVisitsAreValid_ForVisitAtIndex_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v14;
    NSStringFromSelector(sel_applyRule_ShortVisitsAreInvalid_ForVisitAtIndex_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v15;
    NSStringFromSelector(sel_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v70[3] = v16;
    NSStringFromSelector(sel_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70[4] = v17;
    v18 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeAllObjects](self->_tripSegmentVisitStatus, "removeAllObjects");
    if (-[NSMutableArray count](self->_tripSegmentTransitions, "count") != 1)
    {
      v40 = 0;
      *(_QWORD *)&v20 = 138413058;
      v58 = v20;
      do
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v40);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stopDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v40 + 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "startDate");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v40);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v40 + 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v58;
          v63 = (unint64_t)v50;
          v64 = 2112;
          v65 = v52;
          v66 = 2112;
          v67 = v53;
          v68 = 2112;
          v69 = v54;
          _os_log_debug_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: examining visit between dates: %@ and %@, for transitions, %@ and %@", buf, 0x2Au);

          v18 = 0x1E0C99000;
        }

        tripSegmentVisitStatus = self->_tripSegmentVisitStatus;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](tripSegmentVisitStatus, "addObject:", v43);

        if (objc_msgSend(v19, "count"))
        {
          v44 = 0;
          while (1)
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", v44, v58);
            v45 = (NSString *)objc_claimAutoreleasedReturnValue();
            v46 = NSSelectorFromString(v45);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTTripSegmentTransitionPreprocessor performSelector:withObject:](self, "performSelector:withObject:", v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48 != v49)
              break;

            if (++v44 >= (unint64_t)objc_msgSend(v19, "count"))
              goto LABEL_42;
          }
          -[NSMutableArray setObject:atIndexedSubscript:](self->_tripSegmentVisitStatus, "setObject:atIndexedSubscript:", v48, v40);

        }
LABEL_42:
        ++v40;
      }
      while (v40 < -[NSMutableArray count](self->_tripSegmentTransitions, "count", v58) - 1);
    }
    -[RTTripSegmentTransitionPreprocessor tryMergeTransitions](self, "tryMergeTransitions");
    -[RTTripSegmentTransitionPreprocessor appendTransitionToCurrentVisit](self, "appendTransitionToCurrentVisit");
    -[RTTripSegmentTransitionPreprocessor adjustTransitionEndpoints](self, "adjustTransitionEndpoints");
    NSStringFromSelector(sel_applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v21;
    NSStringFromSelector(sel_applyRule_longTransitionsAreInvalid_ForTransitionAtIndex_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v22;
    objc_msgSend(*(id *)(v18 + 3360), "arrayWithObjects:count:", v61, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeAllObjects](self->_tripSegmentTransitionStatus, "removeAllObjects");
    if (-[NSMutableArray count](self->_tripSegmentTransitions, "count"))
    {
      v24 = 0;
      do
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v24);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v63 = (unint64_t)v34;
          _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: examining transition %@", buf, 0xCu);

        }
        tripSegmentTransitionStatus = self->_tripSegmentTransitionStatus;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](tripSegmentTransitionStatus, "addObject:", v27);

        if (objc_msgSend(v23, "count"))
        {
          v28 = 0;
          while (1)
          {
            objc_msgSend(v23, "objectAtIndexedSubscript:", v28);
            v29 = (NSString *)objc_claimAutoreleasedReturnValue();
            v30 = NSSelectorFromString(v29);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTTripSegmentTransitionPreprocessor performSelector:withObject:](self, "performSelector:withObject:", v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32 != v33)
              break;

            if (++v28 >= (unint64_t)objc_msgSend(v23, "count"))
              goto LABEL_23;
          }
          -[NSMutableArray setObject:atIndexedSubscript:](self->_tripSegmentTransitionStatus, "setObject:atIndexedSubscript:", v32, v24);

        }
LABEL_23:
        ++v24;
      }
      while (v24 < -[NSMutableArray count](self->_tripSegmentTransitions, "count"));
    }
    -[RTTripSegmentTransitionPreprocessor tryDeleteTransitions](self, "tryDeleteTransitions");
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v57 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      *(_DWORD *)buf = 134217984;
      v63 = v57;
      _os_log_debug_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: produced %tu output transitions", buf, 0xCu);
    }

    if (-[NSMutableArray count](self->_tripSegmentTransitions, "count"))
    {
      v36 = 0;
      do
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v63 = v36;
          v64 = 2112;
          v65 = v38;
          _os_log_debug_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor, output transition, %ld, %@", buf, 0x16u);

        }
        ++v36;
      }
      while (v36 < -[NSMutableArray count](self->_tripSegmentTransitions, "count"));
    }
    v12 = self->_tripSegmentTransitions;

    v4 = v60;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v56 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      *(_DWORD *)buf = 134217984;
      v63 = v56;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: _tripSegmentTransitions.count == %tu, returning", buf, 0xCu);
    }

    v12 = self->_tripSegmentTransitions;
  }

  return v12;
}

- (void)tryMergeTransitions
{
  void *v3;
  uint64_t v4;
  NSMutableArray *v5;
  void *v6;
  NSObject *v7;
  __int128 v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSMutableArray *v23;
  NSObject *v24;
  NSMutableArray *tripSegmentTransitions;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_tripSegmentTransitions, "copy");
  v4 = -[NSMutableArray count](self->_tripSegmentVisitStatus, "count");
  if (v4 != objc_msgSend(v3, "count") - 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = -[NSMutableArray count](self->_tripSegmentVisitStatus, "count");
      *(_DWORD *)buf = 134218240;
      v30 = v26;
      v31 = 2048;
      v32 = objc_msgSend(v3, "count");
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:updateTransitions, unexpected size for _tripSegmentVisitStatus, %tu, and transitions, %tu", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, transitions nil, returning", buf, 2u);
    }

    v23 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(v3, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v3, "count");
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, size %tu < 1", buf, 0xCu);
    }
LABEL_19:

    v23 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
LABEL_23:
    tripSegmentTransitions = self->_tripSegmentTransitions;
    self->_tripSegmentTransitions = v23;

    goto LABEL_24;
  }
  -[NSMutableArray removeAllObjects](self->_tripSegmentTransitions, "removeAllObjects");
  v5 = self->_tripSegmentTransitions;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[NSMutableArray lastObject](self->_tripSegmentTransitions, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = (uint64_t)v27;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: initializing with transition %@", buf, 0xCu);

  }
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v9 = 1;
    *(_QWORD *)&v8 = 138412290;
    v28 = v8;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentVisitStatus, "objectAtIndexedSubscript:", v9 - 1, v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11 == 2)
      {
        if (v13)
        {
          -[NSMutableArray lastObject](self->_tripSegmentTransitions, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v30 = (uint64_t)v19;
          v31 = 2112;
          v32 = (uint64_t)v20;
          _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: merging transition %@ with %@", buf, 0x16u);

        }
        -[NSMutableArray lastObject](self->_tripSegmentTransitions, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTripSegmentTransitionPreprocessor mergeTransition:withSecond:](self, "mergeTransition:withSecond:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray removeLastObject](self->_tripSegmentTransitions, "removeLastObject");
        v17 = self->_tripSegmentTransitions;
      }
      else
      {
        if (v13)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v28;
          v30 = (uint64_t)v21;
          _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: retaining transition %@", buf, 0xCu);

        }
        v18 = self->_tripSegmentTransitions;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v18;
      }
      -[NSMutableArray addObject:](v17, "addObject:", v16);

      ++v9;
    }
    while (v9 < objc_msgSend(v3, "count"));
  }
LABEL_24:

}

- (void)tryDeleteTransitions
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  NSObject *v14;
  NSMutableArray *v15;
  NSObject *v16;
  NSMutableArray *tripSegmentTransitions;
  uint64_t v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_tripSegmentTransitions, "copy");
  v4 = -[NSMutableArray count](self->_tripSegmentTransitionStatus, "count");
  if (v4 != objc_msgSend(v3, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = -[NSMutableArray count](self->_tripSegmentTransitionStatus, "count");
      *(_DWORD *)buf = 134218240;
      v21 = v18;
      v22 = 2048;
      v23 = objc_msgSend(v3, "count");
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:updateTransitions, unexpected size for _tripSegmentTransitionStatus, %tu, and transitions, %tu", buf, 0x16u);
    }

    v15 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
    goto LABEL_19;
  }
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:updateTransitions, transitions nil, returning", buf, 2u);
    }

    v15 = 0;
LABEL_19:
    tripSegmentTransitions = self->_tripSegmentTransitions;
    self->_tripSegmentTransitions = v15;

    goto LABEL_20;
  }
  -[NSMutableArray removeAllObjects](self->_tripSegmentTransitions, "removeAllObjects");
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    *(_QWORD *)&v5 = 138412290;
    v19 = v5;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitionStatus, "objectAtIndexedSubscript:", v6, v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 == 2)
      {
        if (v10)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v21 = (uint64_t)v11;
          _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: rejecting transition %@", buf, 0xCu);

        }
      }
      else
      {
        if (v10)
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v21 = (uint64_t)v13;
          _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: retaining transition %@", buf, 0xCu);

        }
        v12 = self->_tripSegmentTransitions;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v9 = objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v12, "addObject:", v9);
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
LABEL_20:

}

- (id)mergeTransition:(id)a3 withSecond:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  RTMotionActivityManager *motionActivityManager;
  void *v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  RTLearnedTransition *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  RTLearnedTransition *v36;
  NSObject *v37;
  void *v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[24];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__120;
  v49 = __Block_byref_object_dispose__120;
  v50 = 0;
  v7 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stopDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __66__RTTripSegmentTransitionPreprocessor_mergeTransition_withSecond___block_invoke;
  v41[3] = &unk_1E92971F0;
  v43 = &v51;
  v44 = &v45;
  v11 = v7;
  v42 = v11;
  -[RTMotionActivityManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](motionActivityManager, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v9, v10, v41);

  v12 = (id *)(v46 + 5);
  v13 = (id)v46[5];
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v14, v16))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "timeIntervalSinceDate:", v15);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v56[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v56, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v13 = objc_retainAutorelease(v27);

    }
  }

  objc_storeStrong(v12, v13);
  v28 = [RTLearnedTransition alloc];
  v29 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "startDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stopDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visitIdentifierOrigin");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "visitIdentifierDestination");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expirationDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v28, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v29, v30, v31, v32, v33, v34, v35, v52[3]);

  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v36;
    _os_log_debug_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: merging transitions into, %@", buf, 0xCu);
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v36;
}

void __66__RTTripSegmentTransitionPreprocessor_mergeTransition_withSecond___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, using RTMotionActivityTypeUnknown", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = a2;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentTransitionPreprocessor: Predominant motion activity, %lu", (uint8_t *)&v11, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyRule_LongVisitsAreValid_ForVisitAtIndex:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "integerValue");
  if (v5 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count") - 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v34 = 134218240;
      v35 = v5;
      v36 = 2048;
      v37 = v26 - 2;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v34, 0x16u);
    }

    goto LABEL_13;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isBeforeDate:", v9);

  if ((v10 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stopDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "startDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138413314;
      v35 = (unint64_t)v28;
      v36 = 2112;
      v37 = (uint64_t)v29;
      v38 = 2048;
      v39 = v5;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v33;
      _os_log_debug_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v34, 0x34u);

    }
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v13, v15);

  objc_msgSend(v16, "duration");
  v18 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 <= 7200.0)
  {
    if (v20)
    {
      v34 = 134217984;
      v35 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LongVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v34, 0xCu);
    }
    v21 = 0;
  }
  else
  {
    if (v20)
    {
      v34 = 134217984;
      v35 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LongVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Accept", (uint8_t *)&v34, 0xCu);
    }
    v21 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)applyRule_ShortVisitsAreInvalid_ForVisitAtIndex:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "integerValue");
  if (v5 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count") - 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v34 = 134218240;
      v35 = v5;
      v36 = 2048;
      v37 = v26 - 2;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v34, 0x16u);
    }

    goto LABEL_12;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isBeforeDate:", v9);

  if ((v10 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stopDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "startDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138413314;
      v35 = (unint64_t)v28;
      v36 = 2112;
      v37 = (uint64_t)v29;
      v38 = 2048;
      v39 = v5;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v33;
      _os_log_debug_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v34, 0x34u);

    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5 + 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v13, v15);

  objc_msgSend(v16, "duration");
  v18 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 >= 120.0)
  {
    if (v20)
    {
      v34 = 134217984;
      v35 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v34, 0xCu);
    }
    v21 = 0;
  }
  else if (v20)
  {
    v34 = 134217984;
    v35 = v5;
    v21 = 2;
    _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", (uint8_t *)&v34, 0xCu);
  }
  else
  {
    v21 = 2;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  dispatch_semaphore_t v19;
  RTVehicleStore *vehicleStore;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  unint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  NSObject *dsema;
  id v70;
  void *v71;
  _QWORD v72[4];
  NSObject *v73;
  _BYTE *v74;
  uint8_t v75[16];
  _BYTE buf[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  _BYTE v78[20];
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v5 = objc_msgSend(v70, "integerValue");
  if (v5 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count") - 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v58 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v58 - 2;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v68 = (uint64_t (*)(uint64_t, uint64_t))v5;
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (char *)v68 + 1;
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", (char *)v68 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isBeforeDate:", v10);

  if ((v11 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v68);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stopDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v8);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "startDate");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v60;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v61;
      *(_WORD *)&buf[22] = 2048;
      v77 = v68;
      *(_WORD *)v78 = 2112;
      *(_QWORD *)&v78[2] = v63;
      *(_WORD *)&v78[10] = 2112;
      *(_QWORD *)&v78[12] = v65;
      _os_log_debug_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v40 = (void *)v38;
    goto LABEL_32;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v68);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "initWithStartDate:endDate:", v14, v16);

  v71 = (void *)v17;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18500]), "initWithDateInterval:limit:", v17, 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v77 = __Block_byref_object_copy__120;
  *(_QWORD *)v78 = __Block_byref_object_dispose__120;
  *(_QWORD *)&v78[8] = 0;
  v19 = dispatch_semaphore_create(0);
  vehicleStore = self->_vehicleStore;
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __99__RTTripSegmentTransitionPreprocessor_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex___block_invoke;
  v72[3] = &unk_1E9297010;
  v74 = buf;
  v21 = v19;
  v73 = v21;
  v67 = (void *)v18;
  -[RTVehicleStore fetchVehiclesWithOptions:handler:](vehicleStore, "fetchVehiclesWithOptions:handler:", v18, v72);
  dsema = v21;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v23))
    goto LABEL_15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:", v22);
  v26 = v25;
  v27 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v75, 2u);
  }

  v33 = (void *)MEMORY[0x1E0CB35C8];
  v79[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v75 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v79, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = objc_retainAutorelease(v35);

  }
  else
  {
LABEL_15:
    v36 = 0;
  }

  v66 = v36;
  v41 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v41)
  {
    for (i = 0; i < objc_msgSend(v41, "count", v66); ++i)
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectAtIndexedSubscript:", i);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "dateInterval");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "startDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "startDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "isBeforeDate:", v46))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectAtIndexedSubscript:", i);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "dateInterval");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "endDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "endDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isAfterDate:", v50);

        if (v51)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v75 = 134217984;
            *(_QWORD *)&v75[4] = v68;
            _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_ShortVisitsAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", v75, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
          v54 = objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
      }
      else
      {

      }
      v41 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      goto LABEL_27;
    *(_DWORD *)v75 = 134217984;
    *(_QWORD *)&v75[4] = v68;
    v53 = "RTTripSegmentTransitionPreprocessor: applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex, tripSegmentV"
          "isitStatus[%ld], Passthrough";
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v52 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      goto LABEL_27;
    *(_DWORD *)v75 = 134217984;
    *(_QWORD *)&v75[4] = v68;
    v53 = "RTTripSegmentTransitionPreprocessor: applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex, no vehicles "
          "found for tripSegmentVisitStatus[%ld], Passthrough";
  }
  _os_log_debug_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_DEBUG, v53, v75, 0xCu);
LABEL_27:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v54 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v40 = (void *)v54;

  _Block_object_dispose(buf, 8);
LABEL_32:

  return v40;
}

void __99__RTTripSegmentTransitionPreprocessor_applyRule_VehicleConnectionCannotSpanVisits_ForVisitAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  RTMotionActivityManager *motionActivityManager;
  void *v20;
  void *v21;
  NSObject *v22;
  id *v23;
  void *v24;
  dispatch_time_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  RTMotionActivityHistogram *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  RTMotionActivityHistogram *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  _BOOL4 v62;
  uint64_t v63;
  objc_class *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  unint64_t v74;
  id v75;
  NSObject *dsema;
  _QWORD v77[4];
  id v78;
  NSObject *v79;
  _BYTE *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE v88[14];
  __int16 v89;
  _BOOL4 v90;
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  _BOOL4 v94;
  _BYTE buf[24];
  uint64_t (*v96)(uint64_t, uint64_t);
  _BYTE v97[20];
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "integerValue");
  if (v6 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count") - 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v59 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v59 - 2;
      _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
    }
    goto LABEL_16;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v6 + 1;
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isBeforeDate:", v10);

  if ((v11 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v6);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "stopDate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v74);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "startDate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v67;
      *(_WORD *)&buf[22] = 2048;
      v96 = (uint64_t (*)(uint64_t, uint64_t))v6;
      *(_WORD *)v97 = 2112;
      *(_QWORD *)&v97[2] = v69;
      *(_WORD *)&v97[10] = 2112;
      *(_QWORD *)&v97[12] = v71;
      _os_log_debug_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);

    }
LABEL_16:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v74);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v14, v16);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v96 = __Block_byref_object_copy__120;
  *(_QWORD *)v97 = __Block_byref_object_dispose__120;
  *(_QWORD *)&v97[8] = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__120;
  v86 = __Block_byref_object_dispose__120;
  v87 = 0;
  v18 = dispatch_semaphore_create(0);
  motionActivityManager = self->_motionActivityManager;
  objc_msgSend(v17, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __102__RTTripSegmentTransitionPreprocessor_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex___block_invoke;
  v77[3] = &unk_1E92995B0;
  v75 = v17;
  v78 = v75;
  v80 = buf;
  v81 = &v82;
  v22 = v18;
  v79 = v22;
  -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v20, v21, v77);

  v23 = (id *)(v83 + 5);
  obj = (id)v83[5];
  dsema = v22;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(dsema, v25))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "timeIntervalSinceDate:", v24);
    v27 = v26;
    v28 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "filteredArrayUsingPredicate:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "submitToCoreAnalytics:type:duration:", v32, 1, v27);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v88 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v88, 2u);
    }

    v34 = (void *)MEMORY[0x1E0CB35C8];
    v98[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v88 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v98, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      obj = objc_retainAutorelease(v36);

    }
  }

  objc_storeStrong(v23, obj);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v37 = [RTMotionActivityHistogram alloc];
    v38 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    objc_msgSend(v75, "startDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[RTMotionActivityHistogram initWithActivites:betweenDate:andDate:](v37, "initWithActivites:betweenDate:andDate:", v38, v39, v40);

    -[RTMotionActivityHistogram binsSortedByInterval](v41, "binsSortedByInterval");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "predominantMotionActivityType");

    -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v74);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "predominantMotionActivityType");

    -[RTMotionActivityHistogram binForType:](v41, "binForType:", 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "interval");
    v49 = v48;

    objc_msgSend(v75, "duration");
    v51 = v50;
    objc_msgSend(v42, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v37) = objc_msgSend(v52, "type") == 4;

    if ((v37 & 1) != 0)
    {
      v53 = 1;
    }
    else if ((unint64_t)objc_msgSend(v42, "count") < 3)
    {
      v53 = 0;
    }
    else
    {
      objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "type") == 1)
      {
        objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v58, "type") == 4;

      }
      else
      {
        v53 = 0;
      }

    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v88 = 67110144;
      *(_DWORD *)&v88[4] = v44 == 4;
      *(_WORD *)&v88[8] = 1024;
      *(_DWORD *)&v88[10] = v46 == 4;
      v89 = 1024;
      v90 = v49 == 0.0;
      v91 = 1024;
      v92 = v51 < 2400.0;
      v93 = 1024;
      v94 = v53;
      _os_log_debug_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: previousTransitionIsDriving, %d, subsequentTransitionIsDriving, %d, visitHasNoWalkingActivity, %d, visitDurationIsCandidateForDrivingCheck, %d, visitHasDrivingPredominantActivity, %d", v88, 0x20u);
    }

    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG);
    if (v51 < 2400.0 && v44 == 4 && v46 == 4 && v53 && v49 == 0.0)
    {
      if (v62)
      {
        *(_DWORD *)v88 = 134217984;
        *(_QWORD *)&v88[4] = v6;
        v63 = 2;
        _os_log_debug_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Reject", v88, 0xCu);
      }
      else
      {
        v63 = 2;
      }
    }
    else
    {
      if (v62)
      {
        *(_DWORD *)v88 = 134217984;
        *(_QWORD *)&v88[4] = v6;
        _os_log_debug_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", v88, 0xCu);
      }
      v63 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v88 = 134217984;
      *(_QWORD *)&v88[4] = v6;
      _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", v88, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(buf, 8);

LABEL_36:
  return v55;
}

void __102__RTTripSegmentTransitionPreprocessor_applyRule_VisitsPredominantlyDrivingAreInvalid_ForVisitAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = (uint64_t)v6;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, for visitInterval %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_msgSend(v5, "count");
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 134218242;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: Fetched %tu motion activities, for visitInterval %@", (uint8_t *)&v17, 0x16u);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = v5;
    v8 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)applyRule_LoiVisitsAreValid_ForVisitAtIndex:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "integerValue");
  if (v4 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v21 = 134218240;
      v22 = v4;
      v23 = 2048;
      v24 = v18 - 1;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: visitIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visitIdentifierDestination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTripSegmentTransitionPreprocessor fetchLearnedLocationOfInterestForVisitIdentifier:](self, "fetchLearnedLocationOfInterestForVisitIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v21 = 138412290;
      v22 = (unint64_t)v7;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex fetched learnedLocationOfInterest: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v7
      && (objc_msgSend(v7, "place"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
      && (objc_msgSend(v7, "place"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "type"),
          v10,
          v11))
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "place");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v19, "type"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = (unint64_t)v20;
        _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex fetched learnedLocationOfInterest.place.type: %@", (uint8_t *)&v21, 0xCu);

      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v21 = 134217984;
        v22 = v4;
        _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Accept", (uint8_t *)&v21, 0xCu);
      }
      v14 = 1;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v21 = 134217984;
        v22 = v4;
        _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_LoiVisitsAreValid_ForVisitAtIndex, tripSegmentVisitStatus[%ld], Passthrough", (uint8_t *)&v21, 0xCu);
      }
      v14 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

- (id)applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "integerValue");
  if (v5 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v33 = 134218240;
      v34 = v5;
      v35 = 2048;
      v36 = v23 - 1;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_10;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isBeforeDate:", v9);

  if ((v10 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stopDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138413314;
      v34 = (unint64_t)v27;
      v35 = 2112;
      v36 = (uint64_t)v28;
      v37 = 2048;
      v38 = v5;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v32;
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v33, 0x34u);

    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stopDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v13, v15);

  objc_msgSend(v16, "duration");
  v18 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 >= 120.0)
  {
    if (v20)
    {
      v33 = 134217984;
      v34 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Passthrough", (uint8_t *)&v33, 0xCu);
    }
    v21 = 0;
  }
  else if (v20)
  {
    v33 = 134217984;
    v34 = v5;
    v21 = 2;
    _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_shortTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Reject", (uint8_t *)&v33, 0xCu);
  }
  else
  {
    v21 = 2;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)applyRule_longTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "integerValue");
  if (v5 >= -[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v33 = 134218240;
      v34 = v5;
      v35 = 2048;
      v36 = v23 - 1;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", (uint8_t *)&v33, 0x16u);
    }
    goto LABEL_10;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isBeforeDate:", v9);

  if ((v10 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stopDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138413314;
      v34 = (unint64_t)v27;
      v35 = 2112;
      v36 = (uint64_t)v28;
      v37 = 2048;
      v38 = v5;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v32;
      _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", (uint8_t *)&v33, 0x34u);

    }
LABEL_10:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    return v24;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stopDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v13, v15);

  objc_msgSend(v16, "duration");
  v18 = v17;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18 <= 43200.0)
  {
    if (v20)
    {
      v33 = 134217984;
      v34 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Passthrough", (uint8_t *)&v33, 0xCu);
    }
    v21 = 0;
  }
  else if (v20)
  {
    v33 = 134217984;
    v34 = v5;
    v21 = 2;
    _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], Reject", (uint8_t *)&v33, 0xCu);
  }
  else
  {
    v21 = 2;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id *v12;
  id v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id *v32;
  id v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  RTDistanceCalculator *distanceCalculator;
  void *v66;
  void *v67;
  double v68;
  double v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  NSObject *v76;
  _BOOL4 v77;
  uint64_t v78;
  objc_class *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *aSelector;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  NSObject *v94;
  NSObject *dsema;
  id v96;
  _QWORD v97[4];
  NSObject *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _QWORD v107[4];
  NSObject *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _BYTE buf[12];
  __int16 v124;
  double v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  _QWORD v138[4];

  aSelector = a2;
  v138[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  v93 = v4;
  if (v5 < -[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    v92 = v5;
    -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visitIdentifierOrigin");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visitIdentifierDestination");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = 0;
    v118 = &v117;
    v119 = 0x3032000000;
    v120 = __Block_byref_object_copy__120;
    v121 = __Block_byref_object_dispose__120;
    v122 = 0;
    v8 = dispatch_semaphore_create(0);
    v111 = 0;
    v112 = &v111;
    v113 = 0x3032000000;
    v114 = __Block_byref_object_copy__120;
    v115 = __Block_byref_object_dispose__120;
    v116 = 0;
    -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "learnedLocationStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke;
    v107[3] = &unk_1E9298D70;
    v109 = &v117;
    v110 = &v111;
    v11 = v8;
    v108 = v11;
    objc_msgSend(v10, "fetchVisitWithIdentifier:handler:", v91, v107);

    v12 = (id *)(v112 + 5);
    v13 = (id)v112[5];
    dsema = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v15))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v132 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v132, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v13 = objc_retainAutorelease(v27);

      }
    }

    objc_storeStrong(v12, v13);
    v132 = 0;
    v133 = &v132;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__120;
    v136 = __Block_byref_object_dispose__120;
    v137 = 0;
    v28 = dispatch_semaphore_create(0);
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__120;
    v105 = __Block_byref_object_dispose__120;
    v106 = 0;
    -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "learnedLocationStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke_2;
    v97[3] = &unk_1E9298D70;
    v99 = &v132;
    v100 = &v101;
    v31 = v28;
    v98 = v31;
    objc_msgSend(v30, "fetchVisitWithIdentifier:handler:", v90, v97);

    v32 = (id *)(v102 + 5);
    v33 = (id)v102[5];
    v94 = v31;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v94, v35))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSinceDate:", v34);
      v38 = v37;
      v39 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v45 = (void *)MEMORY[0x1E0CB35C8];
      v138[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v138, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v33 = objc_retainAutorelease(v47);

      }
    }

    objc_storeStrong(v32, v33);
    if (v118[5] && v133[5])
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stopDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92 + 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "startDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v49, "isBeforeDate:", v51);

      if ((v52 & 1) != 0)
      {
        v53 = objc_alloc(MEMORY[0x1E0CB3588]);
        -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "startDate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stopDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v53, "initWithStartDate:endDate:", v55, v57);

        objc_msgSend(v58, "duration");
        if (v59 >= 3600.0)
        {
          distanceCalculator = self->_distanceCalculator;
          objc_msgSend((id)v118[5], "location");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v133[5], "location");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v66, v67, &v96);
          v69 = v68;
          v70 = v96;

          if (v70)
          {
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)v118[5], "location");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v133[5], "location");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v87;
              v124 = 2112;
              v125 = *(double *)&v88;
              _os_log_error_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: failed to compute distance from %@ to %@. Passthrough.", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
            v72 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v58, "duration");
            v75 = v69 / v74;
            _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
            v76 = objc_claimAutoreleasedReturnValue();
            v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG);
            if (v75 <= 60.0)
            {
              if (v77)
              {
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v92;
                _os_log_debug_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld]. Passthrough.", buf, 0xCu);
              }
              v78 = 0;
            }
            else if (v77)
            {
              *(_DWORD *)buf = 134218496;
              *(_QWORD *)&buf[4] = v92;
              v124 = 2048;
              v125 = v75;
              v126 = 2048;
              v127 = 0x404E000000000000;
              v78 = 2;
              _os_log_debug_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: applyRule_longTransitionsAreInvalid_ForTransitionAtIndex, tripSegmentTransitionStatus[%ld], average speed %f msps above threshold %f mps. Reject.", buf, 0x20u);
            }
            else
            {
              v78 = 2;
            }

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v78);
            v72 = objc_claimAutoreleasedReturnValue();
          }
          v61 = (void *)v72;

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v58, "duration");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v86;
            _os_log_debug_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: transition duration %f s too short for average speed check. Passthrough.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_27;
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        v79 = (objc_class *)objc_opt_class();
        NSStringFromClass(v79);
        v80 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v81 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "stopDate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v92 + 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "startDate");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v80;
        v124 = 2112;
        v125 = *(double *)&v81;
        v126 = 2048;
        v127 = v92;
        v128 = 2112;
        v129 = v83;
        v130 = 2112;
        v131 = v85;
        _os_log_debug_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_DEBUG, "%@:%@, malformed transition, tripSegmentVisitStatus[%ld], start/stop dates: %@, %@, Passthrough", buf, 0x34u);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v91;
        v124 = 2112;
        v125 = *(double *)&v90;
        _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex: failed to fetch visit location for identifiers %@ and %@. Passthrough.", buf, 0x16u);
      }
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

    _Block_object_dispose(&v101, 8);
    _Block_object_dispose(&v132, 8);

    _Block_object_dispose(&v111, 8);
    _Block_object_dispose(&v117, 8);

    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    v73 = -[NSMutableArray count](self->_tripSegmentTransitions, "count", aSelector);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v5;
    v124 = 2048;
    *(_QWORD *)&v125 = v73 - 1;
    _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: transitionIndex, %ld, out of range [0, %tu]. Passthrough", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v61;
}

void __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2 && !v5)
  {
    objc_msgSend(a2, "location");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __108__RTTripSegmentTransitionPreprocessor_applyRule_highAverageSpeedTransitionsAreInvalid_ForTransitionAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2 && !v5)
  {
    objc_msgSend(a2, "location");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)fetchLearnedLocationOfInterestForVisitIdentifier:(id)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_semaphore_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id *v32;
  id v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  uint64_t v52;
  uint64_t v53;
  RTTripSegmentTransitionPreprocessor *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  NSObject *v58;
  __int128 *p_buf;
  uint64_t *v60;
  _QWORD v61[4];
  NSObject *v62;
  uint8_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t v71[8];
  uint8_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t v77[16];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (v56)
  {
    *(_QWORD *)v71 = 0;
    v72 = v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__120;
    v75 = __Block_byref_object_dispose__120;
    v76 = 0;
    v4 = dispatch_semaphore_create(0);
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__120;
    v69 = __Block_byref_object_dispose__120;
    v70 = 0;
    v54 = self;
    -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "learnedLocationStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke;
    v61[3] = &unk_1E9298D70;
    v63 = v71;
    v64 = &v65;
    v7 = v4;
    v62 = v7;
    objc_msgSend(v6, "fetchVisitWithIdentifier:handler:", v56, v61);

    v8 = (id *)(v66 + 5);
    v9 = (id)v66[5];
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v10, v12))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v11);
      v15 = v14;
      v16 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&buf, 2u);
      }

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v78, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v9 = objc_retainAutorelease(v24);

      }
    }

    objc_storeStrong(v8, v9);
    v25 = *((_QWORD *)v72 + 5);
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v52 = *((_QWORD *)v72 + 5);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v52;
        _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocation: %@", (uint8_t *)&buf, 0xCu);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v85 = 0x3032000000;
      v86 = __Block_byref_object_copy__120;
      v87 = __Block_byref_object_dispose__120;
      v88 = 0;
      v28 = dispatch_semaphore_create(0);
      v78 = 0;
      v79 = &v78;
      v80 = 0x3032000000;
      v81 = __Block_byref_object_copy__120;
      v82 = __Block_byref_object_dispose__120;
      v83 = 0;
      -[RTTripSegmentTransitionPreprocessor learnedLocationManager](v54, "learnedLocationManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v72 + 5), "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke_77;
      v57[3] = &unk_1E9297478;
      p_buf = &buf;
      v60 = &v78;
      v31 = v28;
      v58 = v31;
      objc_msgSend(v29, "fetchLocationOfInterestAtLocation:handler:", v30, v57);

      v32 = (id *)(v79 + 5);
      v33 = (id)v79[5];
      v34 = v31;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v34, v36))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "timeIntervalSinceDate:", v35);
        v38 = v37;
        v39 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v77 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
        }

        v45 = (void *)MEMORY[0x1E0CB35C8];
        v89[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v77 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v89, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v33 = objc_retainAutorelease(v47);

        }
      }

      objc_storeStrong(v32, v33);
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v53 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v77 = 138412290;
        *(_QWORD *)&v77[4] = v53;
        _os_log_debug_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocationOfInterest: %@", v77, 0xCu);
      }

      v49 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      _Block_object_dispose(&v78, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v56;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestForVisitIdentifier: failed to fetch visit for identifier %@", (uint8_t *)&buf, 0xCu);
      }

      v49 = 0;
    }

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(v71, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v71 = 0;
      _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestForVisitIdentifier no visit identifier provided, returning.", v71, 2u);
    }

    v49 = 0;
  }

  return v49;
}

void __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = v5;
  if (a2 && !v5)
  {
    objc_msgSend(a2, "location");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v6;
  v12 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestForVisitIdentifier___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (v10 && !v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)fetchLearnedLocationOfInterestWithinDistance:(double)a3 location:(id)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id *v11;
  id v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint8_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t v43[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[24];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    *(_QWORD *)v43 = 0;
    v44 = v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__120;
    v47 = __Block_byref_object_dispose__120;
    v48 = 0;
    v7 = dispatch_semaphore_create(0);
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__120;
    v41 = __Block_byref_object_dispose__120;
    v42 = 0;
    -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "learnedLocationStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __93__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestWithinDistance_location___block_invoke;
    v33[3] = &unk_1E9296EE0;
    v35 = v43;
    v36 = &v37;
    v10 = v7;
    v34 = v10;
    objc_msgSend(v9, "fetchLocationsOfInterestWithinDistance:location:handler:", v6, v33, a3);

    v11 = (id *)(v38 + 5);
    v12 = (id)v38[5];
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v13, v15))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceDate:", v14);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v50[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v50, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v12 = objc_retainAutorelease(v26);

      }
    }

    objc_storeStrong(v11, v12);
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v31 = *((_QWORD *)v44 + 5);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v31;
      _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchLearnedLocationOfInterestForVisitIdentifier fetched learnedLocationOfInterest: %@", buf, 0xCu);
    }

    v28 = *((id *)v44 + 5);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(v43, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v43 = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:fetchLearnedLocationOfInterestWithinDistance no location provided, returning.", v43, 2u);
    }

    v28 = 0;
  }

  return v28;
}

void __93__RTTripSegmentTransitionPreprocessor_fetchLearnedLocationOfInterestWithinDistance_location___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v5 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v12, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)appendTransitionToCurrentVisit
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  id *v9;
  id v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  dispatch_semaphore_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id *v39;
  id v40;
  void *v41;
  dispatch_time_t v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  _BOOL4 v56;
  RTDistanceCalculator *distanceCalculator;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  NSObject *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  double v76;
  NSObject *v77;
  uint64_t v78;
  NSObject *v79;
  _BOOL4 v80;
  uint64_t v81;
  dispatch_semaphore_t v82;
  RTMotionActivityManager *motionActivityManager;
  void *v84;
  void *v85;
  NSObject *v86;
  id v87;
  id *v88;
  dispatch_time_t v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  RTLearnedTransition *v112;
  RTLearnedTransition *v113;
  dispatch_semaphore_t v114;
  NSObject *v115;
  NSObject *dsema;
  uint64_t v117;
  _QWORD v119[4];
  NSObject *v120;
  uint64_t *v121;
  _BYTE *v122;
  id v123;
  _QWORD v124[4];
  NSObject *v125;
  __int128 *v126;
  uint64_t *v127;
  _QWORD v128[4];
  NSObject *v129;
  uint8_t *v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  uint8_t buf[8];
  uint8_t *v139;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint8_t v144[16];
  _BYTE v145[24];
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  __int128 v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  _QWORD v164[4];

  v164[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit - start.", buf, 2u);
  }

  if (-[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D18508]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9328C58);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend(v3, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v4, 0, 0, &unk_1E9328C40, v5);

    *(_QWORD *)buf = 0;
    v139 = buf;
    v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__120;
    v142 = __Block_byref_object_dispose__120;
    v143 = 0;
    v132 = 0;
    v133 = &v132;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__120;
    v136 = __Block_byref_object_dispose__120;
    v137 = 0;
    v6 = dispatch_semaphore_create(0);
    -[RTTripSegmentTransitionPreprocessor visitManager](self, "visitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke;
    v128[3] = &unk_1E9296EE0;
    v130 = buf;
    v131 = &v132;
    v8 = v6;
    v129 = v8;
    objc_msgSend(v7, "fetchStoredVisitsWithOptions:handler:", v117, v128);

    v9 = (id *)(v139 + 40);
    v10 = (id)*((_QWORD *)v139 + 5);
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v11, v13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v159) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)&v159, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v153 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)&v159 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v153, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v10 = objc_retainAutorelease(v25);

      }
    }

    objc_storeStrong(v9, v10);
    if (*((_QWORD *)v139 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = *((_QWORD *)v139 + 5);
        LODWORD(v159) = 138412290;
        *(_QWORD *)((char *)&v159 + 4) = v27;
        v28 = "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, failed to fetch visit: %@, not adding "
              "transition to current location.";
        v29 = v26;
        v30 = 12;
LABEL_19:
        _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v159, v30);
      }
    }
    else
    {
      v32 = (void *)v133[5];
      if (v32 && objc_msgSend(v32, "type") && objc_msgSend((id)v133[5], "type") != 3)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v78 = v133[5];
          LODWORD(v159) = 138412290;
          *(_QWORD *)((char *)&v159 + 4) = v78;
          _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, found current (destination) visit: %@", (uint8_t *)&v159, 0xCu);
        }

        -[NSMutableArray lastObject](self->_tripSegmentTransitions, "lastObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "visitIdentifierDestination");
        v26 = objc_claimAutoreleasedReturnValue();

        *(_QWORD *)&v159 = 0;
        *((_QWORD *)&v159 + 1) = &v159;
        v160 = 0x3032000000;
        v161 = __Block_byref_object_copy__120;
        v162 = __Block_byref_object_dispose__120;
        v163 = 0;
        v35 = dispatch_semaphore_create(0);
        v153 = 0;
        v154 = &v153;
        v155 = 0x3032000000;
        v156 = __Block_byref_object_copy__120;
        v157 = __Block_byref_object_dispose__120;
        v158 = 0;
        -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "learnedLocationStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v124[0] = MEMORY[0x1E0C809B0];
        v124[1] = 3221225472;
        v124[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_84;
        v124[3] = &unk_1E9298D70;
        v126 = &v159;
        v127 = &v153;
        v38 = v35;
        v125 = v38;
        objc_msgSend(v37, "fetchVisitWithIdentifier:handler:", v26, v124);

        v39 = (id *)(v154 + 5);
        v40 = (id)v154[5];
        dsema = v38;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = dispatch_time(0, 3600000000000);
        if (dispatch_semaphore_wait(dsema, v42))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v114 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
          -[NSObject timeIntervalSinceDate:](v114, "timeIntervalSinceDate:", v41);
          v44 = v43;
          v45 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "filteredArrayUsingPredicate:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "submitToCoreAnalytics:type:duration:", v49, 1, v44);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v145 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v145, 2u);
          }

          v51 = (void *)MEMORY[0x1E0CB35C8];
          v149 = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v145 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, &v149, 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v53)
          {
            v40 = objc_retainAutorelease(v53);

          }
        }

        objc_storeStrong(v39, v40);
        v54 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 40);
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v55 = objc_claimAutoreleasedReturnValue();
        v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
        if (v54)
        {
          if (v56)
          {
            v81 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 40);
            *(_DWORD *)v145 = 138412290;
            *(_QWORD *)&v145[4] = v81;
            _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit, found origin visit: %@", v145, 0xCu);
          }

          distanceCalculator = self->_distanceCalculator;
          objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 40), "location");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "location");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v133[5], "location");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = 0;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v59, v60, &v123);
          v62 = v61;
          v55 = v123;

          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG);
          if (v55)
          {
            if (v64)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 40), "location");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "location");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v133[5], "location");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v145 = 138412546;
              *(_QWORD *)&v145[4] = v66;
              *(_WORD *)&v145[12] = 2112;
              *(_QWORD *)&v145[14] = v67;
              _os_log_debug_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: failed to compute distance from %@ to %@, not adding transition to current location.", v145, 0x16u);

            }
          }
          else
          {
            if (v64)
            {
              *(_DWORD *)v145 = 134217984;
              *(double *)&v145[4] = v62;
              _os_log_debug_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: computed distanceFromLastVisit %.3f m.", v145, 0xCu);
            }

            objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 40), "exitDate");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v133[5], "entry");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v68, "isOnOrAfter:", v69);

            if (v70)
            {
              _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                v71 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 40);
                v72 = v133[5];
                *(_DWORD *)v145 = 138412546;
                *(_QWORD *)&v145[4] = v71;
                *(_WORD *)&v145[12] = 2112;
                *(_QWORD *)&v145[14] = v72;
                _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: originVisit.exitDate, %@, is on or after, destinationVisit.entry, %@, not adding transition to current location.", v145, 0x16u);
              }
            }
            else
            {
              v73 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(*(id *)(*((_QWORD *)&v159 + 1) + 40), "exitDate");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v133[5], "entry");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v73, "initWithStartDate:endDate:", v74, v75);

              -[NSObject duration](v63, "duration");
              if (v76 >= 120.0)
              {
                _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                v79 = objc_claimAutoreleasedReturnValue();
                v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG);
                if (v62 >= 500.0)
                {
                  if (v80)
                  {
                    *(_DWORD *)v145 = 138412546;
                    *(_QWORD *)&v145[4] = v63;
                    *(_WORD *)&v145[12] = 2048;
                    *(double *)&v145[14] = v62;
                    _os_log_debug_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition interval %@, distance %f m.", v145, 0x16u);
                  }

                  v149 = 0;
                  v150 = &v149;
                  v151 = 0x2020000000;
                  v152 = 0;
                  *(_QWORD *)v145 = 0;
                  *(_QWORD *)&v145[8] = v145;
                  *(_QWORD *)&v145[16] = 0x3032000000;
                  v146 = __Block_byref_object_copy__120;
                  v147 = __Block_byref_object_dispose__120;
                  v148 = 0;
                  v82 = dispatch_semaphore_create(0);
                  motionActivityManager = self->_motionActivityManager;
                  -[NSObject startDate](v63, "startDate");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject endDate](v63, "endDate");
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  v119[0] = MEMORY[0x1E0C809B0];
                  v119[1] = 3221225472;
                  v119[2] = __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_85;
                  v119[3] = &unk_1E92971F0;
                  v121 = &v149;
                  v122 = v145;
                  v86 = v82;
                  v120 = v86;
                  -[RTMotionActivityManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:](motionActivityManager, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v84, v85, v119);

                  v88 = (id *)(*(_QWORD *)&v145[8] + 40);
                  v87 = *(id *)(*(_QWORD *)&v145[8] + 40);
                  v115 = v86;
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = dispatch_time(0, 3600000000000);
                  if (dispatch_semaphore_wait(v115, v89))
                  {
                    objc_msgSend(MEMORY[0x1E0C99D68], "now");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "timeIntervalSinceDate:", v111);
                    v91 = v90;
                    v107 = (void *)objc_opt_new();
                    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "filteredArrayUsingPredicate:", v92);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "firstObject");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v107, "submitToCoreAnalytics:type:duration:", v95, 1, v91);
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v96 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)v144 = 0;
                      _os_log_fault_impl(&dword_1D1A22000, v96, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v144, 2u);
                    }

                    v97 = (void *)MEMORY[0x1E0CB35C8];
                    v164[0] = *MEMORY[0x1E0CB2D50];
                    *(_QWORD *)v144 = CFSTR("semaphore wait timeout");
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v164, 1);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v98);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v99)
                    {
                      v87 = objc_retainAutorelease(v99);

                    }
                  }

                  objc_storeStrong(v88, v87);
                  v112 = [RTLearnedTransition alloc];
                  +[RTTripSegmentManager uuidForTripSegmentOfType:](RTTripSegmentManager, "uuidForTripSegmentOfType:", 1);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject startDate](v63, "startDate");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject endDate](v63, "endDate");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray lastObject](self->_tripSegmentTransitions, "lastObject");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "visitIdentifierDestination");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  +[RTTripSegmentManager uuidForTripSegmentOfType:](RTTripSegmentManager, "uuidForTripSegmentOfType:", 1);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99D68], "now");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 86400.0);
                  v113 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v112, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v100, v110, v108, v102, v103, v104, v105, v150[3]);

                  -[NSMutableArray addObject:](self->_tripSegmentTransitions, "addObject:", v113);
                  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                  v106 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v144 = 138412290;
                    *(_QWORD *)&v144[4] = v113;
                    _os_log_debug_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adding transition to current visit %@", v144, 0xCu);
                  }

                  _Block_object_dispose(v145, 8);
                  _Block_object_dispose(&v149, 8);
                }
                else
                {
                  if (v80)
                  {
                    *(_DWORD *)v145 = 134218240;
                    *(double *)&v145[4] = v62;
                    *(_WORD *)&v145[12] = 2048;
                    *(_QWORD *)&v145[14] = 0x407F400000000000;
                    _os_log_debug_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition distance from last visit %f less than threshold %f, not adding transition to current location.", v145, 0x16u);
                  }

                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v145 = 138412546;
                  *(_QWORD *)&v145[4] = v63;
                  *(_WORD *)&v145[12] = 2048;
                  *(_QWORD *)&v145[14] = 0x405E000000000000;
                  _os_log_debug_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit: transition interval %@ less than threshold %f, not adding transition to current location.", v145, 0x16u);
                }

              }
            }
          }

        }
        else if (v56)
        {
          *(_DWORD *)v145 = 138412290;
          *(_QWORD *)&v145[4] = v26;
          _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit cannot find origin visit with identifier %@, not adding transition to current location", v145, 0xCu);
        }

        _Block_object_dispose(&v153, 8);
        _Block_object_dispose(&v159, 8);

        goto LABEL_60;
      }
      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v159) = 0;
        v28 = "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit not currently in a visit, not adding tr"
              "ansition to current location.";
        v29 = v26;
        v30 = 2;
        goto LABEL_19;
      }
    }
LABEL_60:

    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(buf, 8);

    v31 = v117;
    goto LABEL_61;
  }
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor:appendTransitionToCurrentVisit no previous transitions, not adding transition to current visit.", buf, 2u);
  }
LABEL_61:

}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (v10 && !v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__RTTripSegmentTransitionPreprocessor_appendTransitionToCurrentVisit__block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: Failed to fetch motion activities, error, %@, using RTMotionActivityTypeUnknown", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = a2;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "RTTripSegmentTransitionPreprocessor: Predominant motion activity, %lu", (uint8_t *)&v11, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)applyElevationAdjustmentToLoiLocations
{
  void *v2;
  void *v3;
  char v4;

  -[RTTripSegmentTransitionPreprocessor defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsTripSegmentAdjustElevationForBreadcrumbs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)fetchEndpointCLLocationForTransition:(id)a3 atOrigin:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  dispatch_semaphore_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id *v41;
  NSObject *v42;
  dispatch_time_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  id obja;
  void *v69;
  _QWORD v70[4];
  NSObject *v71;
  uint64_t *v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[4];
  NSObject *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  _BYTE v97[32];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _OWORD v104[2];
  uint8_t buf[32];
  _OWORD v106[2];
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;
  _OWORD v110[2];
  uint64_t v111;
  uint8_t v112[8];
  uint64_t v113;

  v4 = a4;
  v113 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65 = v4;
  v66 = v5;
  if (v4)
    objc_msgSend(v5, "visitIdentifierOrigin");
  else
    objc_msgSend(v5, "visitIdentifierDestination");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__120;
  v94 = __Block_byref_object_dispose__120;
  v95 = 0;
  v6 = dispatch_semaphore_create(0);
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__120;
  v88 = __Block_byref_object_dispose__120;
  v89 = 0;
  -[RTTripSegmentTransitionPreprocessor learnedLocationManager](self, "learnedLocationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke;
  v80[3] = &unk_1E9298D70;
  v82 = &v90;
  v83 = &v84;
  v9 = v6;
  v81 = v9;
  objc_msgSend(v8, "fetchVisitWithIdentifier:handler:", v69, v80);

  v10 = (id *)(v85 + 5);
  v11 = (id)v85[5];
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v97 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v97, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v11 = objc_retainAutorelease(v26);

    }
  }

  objc_storeStrong(v10, v11);
  v27 = v91[5];
  _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v57 = v91[5];
      v58 = "destination";
      if (v65)
        v58 = "origin";
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v58;
      _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: fetched visit, %@, for identifier, %@, at %s", buf, 0x20u);
    }

    if (v65)
      objc_msgSend(v66, "startDate");
    else
      objc_msgSend(v66, "stopDate");
    v29 = objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    memset(v110, 0, 28);
    v108 = 0u;
    memset(v107, 0, sizeof(v107));
    memset(v106, 0, sizeof(v106));
    memset(buf, 0, sizeof(buf));
    v31 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend((id)v91[5], "location");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithRTLocation:", v32);
    v34 = v33;
    if (v33)
    {
      objc_msgSend(v33, "clientLocation");
    }
    else
    {
      v109 = 0u;
      memset(v110, 0, 28);
      v108 = 0u;
      memset(v107, 0, sizeof(v107));
      memset(v106, 0, sizeof(v106));
      memset(buf, 0, sizeof(buf));
    }

    *(_OWORD *)((char *)v106 + 12) = xmmword_1D1EEDB20;
    LODWORD(v108) = 13;
    -[NSObject timeIntervalSinceReferenceDate](v29, "timeIntervalSinceReferenceDate");
    *(_QWORD *)((char *)v107 + 12) = v35;
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__120;
    v78 = __Block_byref_object_dispose__120;
    v36 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v102 = v108;
    v103 = v109;
    v104[0] = v110[0];
    *(_OWORD *)((char *)v104 + 12) = *(_OWORD *)((char *)v110 + 12);
    v98 = v106[0];
    v99 = v106[1];
    v100 = v107[0];
    v101 = v107[1];
    *(_OWORD *)v97 = *(_OWORD *)buf;
    *(_OWORD *)&v97[16] = *(_OWORD *)&buf[16];
    v79 = (id)objc_msgSend(v36, "initWithClientLocation:", v97);
    if (-[RTTripSegmentTransitionPreprocessor applyElevationAdjustmentToLoiLocations](self, "applyElevationAdjustmentToLoiLocations"))
    {
      v37 = dispatch_semaphore_create(0);
      *(_QWORD *)v97 = 0;
      *(_QWORD *)&v97[8] = v97;
      *(_QWORD *)&v97[16] = 0x3032000000;
      *(_QWORD *)&v97[24] = __Block_byref_object_copy__120;
      *(_QWORD *)&v98 = __Block_byref_object_dispose__120;
      *((_QWORD *)&v98 + 1) = 0;
      -[RTTripSegmentTransitionPreprocessor elevationAdjuster](self, "elevationAdjuster");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v75[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke_93;
      v70[3] = &unk_1E9296EE0;
      v72 = &v74;
      v73 = v97;
      v40 = v37;
      v71 = v40;
      objc_msgSend(v38, "adjustElevationForLocations:handler:", v39, v70);

      v41 = (id *)(*(_QWORD *)&v97[8] + 40);
      obja = *(id *)(*(_QWORD *)&v97[8] + 40);
      v42 = v40;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v42, v43))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "timeIntervalSinceDate:", v64);
        v45 = v44;
        v46 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "firstObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v112 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v112, 2u);
        }

        v52 = (void *)MEMORY[0x1E0CB35C8];
        v111 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v112 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, &v111, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          obja = objc_retainAutorelease(v54);

        }
      }

      objc_storeStrong(v41, obja);
      _Block_object_dispose(v97, 8);

    }
    _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      v59 = v75[5];
      -[NSObject timeIntervalSinceReferenceDate](v29, "timeIntervalSinceReferenceDate");
      v61 = "destination";
      *(_DWORD *)v97 = 138413058;
      *(_QWORD *)&v97[4] = v69;
      *(_WORD *)&v97[12] = 2080;
      if (v65)
        v61 = "origin";
      *(_QWORD *)&v97[14] = v61;
      *(_WORD *)&v97[22] = 2112;
      *(_QWORD *)&v97[24] = v59;
      LOWORD(v98) = 2048;
      *(_QWORD *)((char *)&v98 + 2) = v60;
      _os_log_debug_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: identifier, %@, %s, LOI CLLocation, %@, timestamp, %.6f", v97, 0x2Au);
    }

    v30 = (id)v75[5];
    _Block_object_dispose(&v74, 8);

  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v62 = "destination";
      if (v65)
        v62 = "origin";
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v69;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v62;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "RTTripSegmentTransitionPreprocessor: fetchEndpointCLLocationForTransition: failed to fetch visit for identifier %@ at %s", buf, 0x16u);
    }
    v30 = 0;
  }

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);

  return v30;
}

void __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "location");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __85__RTTripSegmentTransitionPreprocessor_fetchEndpointCLLocationForTransition_atOrigin___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (!v5 && objc_msgSend(v12, "count") == 1)
  {
    objc_msgSend(v12, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)adjustTransitionEndpoints
{
  NSMutableDictionary *v2;
  NSMutableDictionary *transitionStartStopLocations;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_semaphore_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  dispatch_time_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  RTDistanceCalculator *distanceCalculator;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  id v79;
  NSObject *v80;
  RTDistanceCalculator *v81;
  id v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  id v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  double v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  uint64_t v113;
  int v114;
  NSObject *v115;
  _BOOL4 v116;
  uint64_t v117;
  id v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  id v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  int v129;
  NSObject *v130;
  _BOOL4 v131;
  uint64_t v132;
  id v133;
  RTLearnedTransition *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  RTLearnedTransition *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  TransitionStartStopLocations *v146;
  NSMutableDictionary *v147;
  void *v148;
  void *v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  NSObject *v168;
  NSObject *dsema;
  id v171;
  id v172;
  _QWORD v173[4];
  NSObject *v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  id v181;
  _QWORD v182[4];
  NSObject *v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t, uint64_t);
  void (*v189)(uint64_t);
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  _OWORD v199[2];
  uint8_t buf[32];
  __int128 v201;
  __int128 v202;
  _OWORD v203[2];
  __int128 v204;
  __int128 v205;
  _OWORD v206[2];
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  transitionStartStopLocations = self->_transitionStartStopLocations;
  self->_transitionStartStopLocations = v2;

  if (-[NSMutableArray count](self->_tripSegmentTransitions, "count"))
  {
    v4 = 0;
    v157 = *MEMORY[0x1E0D18598];
    v158 = *MEMORY[0x1E0CB2D50];
    do
    {
      v166 = v4;
      -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTripSegmentTransitionPreprocessor fetchEndpointCLLocationForTransition:atOrigin:](self, "fetchEndpointCLLocationForTransition:atOrigin:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTripSegmentTransitionPreprocessor fetchEndpointCLLocationForTransition:atOrigin:](self, "fetchEndpointCLLocationForTransition:atOrigin:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0D184F0]);
      v9 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);
      v165 = (void *)objc_msgSend(v8, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v12, 1, 0, 1.79769313e308);

      v185 = 0;
      v186 = &v185;
      v187 = 0x3032000000;
      v188 = __Block_byref_object_copy__120;
      v189 = __Block_byref_object_dispose__120;
      v190 = 0;
      v13 = dispatch_semaphore_create(0);
      -[RTTripSegmentTransitionPreprocessor locationManager](self, "locationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v182[0] = MEMORY[0x1E0C809B0];
      v182[1] = 3221225472;
      v182[2] = __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke;
      v182[3] = &unk_1E9297010;
      v184 = &v185;
      v15 = v13;
      v183 = v15;
      objc_msgSend(v14, "fetchStoredLocationsWithOptions:handler:", v165, v182);

      dsema = v15;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(dsema, v17))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v16);
        v20 = v19;
        v21 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v27 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)&v191 = v158;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v191, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v157, 15, v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v29 = objc_retainAutorelease(v29);

        }
      }
      else
      {
        v29 = 0;
      }

      v30 = v29;
      v31 = objc_alloc(MEMORY[0x1E0D184F0]);
      v32 = objc_alloc(MEMORY[0x1E0CB3588]);
      v33 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v5, "stopDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v33, "initWithTimeInterval:sinceDate:", v34, -3600.0);
      objc_msgSend(v5, "stopDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v32, "initWithStartDate:endDate:", v35, v36);
      v164 = (void *)objc_msgSend(v31, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v37, -1, 0, 1.79769313e308);

      v176 = 0;
      v177 = &v176;
      v178 = 0x3032000000;
      v179 = __Block_byref_object_copy__120;
      v180 = __Block_byref_object_dispose__120;
      v181 = 0;

      v38 = dispatch_semaphore_create(0);
      -[RTTripSegmentTransitionPreprocessor locationManager](self, "locationManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v173[0] = MEMORY[0x1E0C809B0];
      v173[1] = 3221225472;
      v173[2] = __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke_2;
      v173[3] = &unk_1E9297010;
      v175 = &v176;
      v40 = v38;
      v174 = v40;
      objc_msgSend(v39, "fetchStoredLocationsWithOptions:handler:", v164, v173);

      v168 = v40;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v168, v42))
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v41);
      v45 = v44;
      v46 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_92);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "filteredArrayUsingPredicate:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v50, 1, v45);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v52 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)&v191 = v158;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v191, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", v157, 15, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        v55 = objc_retainAutorelease(v54);

      }
      else
      {
LABEL_14:
        v55 = 0;
      }

      v163 = v55;
      v57 = -1.0;
      if (v186[5] && v6)
      {
        distanceCalculator = self->_distanceCalculator;
        v59 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v6, "coordinate");
        v61 = v60;
        objc_msgSend(v6, "coordinate");
        v63 = v62;
        objc_msgSend(v6, "horizontalAccuracy");
        v65 = v64;
        objc_msgSend(v6, "timestamp");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_msgSend(v59, "initWithLatitude:longitude:horizontalUncertainty:date:", v66, v61, v63, v65);
        v68 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend((id)v186[5], "coordinate");
        v70 = v69;
        objc_msgSend((id)v186[5], "coordinate");
        v72 = v71;
        objc_msgSend((id)v186[5], "horizontalAccuracy");
        v74 = v73;
        objc_msgSend((id)v186[5], "timestamp");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)objc_msgSend(v68, "initWithLatitude:longitude:horizontalUncertainty:date:", v75, v70, v72, v74);
        v172 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v67, v76, &v172);
        v78 = v77;
        v79 = v172;

        if (v78 < 150.0 && !v79)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            v151 = v186[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v151;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v78;
            _os_log_debug_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: startLoiLocation %@ and startBreadcrumb %@ are within %f m, not adding start LOI", buf, 0x20u);
          }

          v6 = 0;
        }

      }
      else
      {
        v78 = -1.0;
      }
      if (v177[5] && v7)
      {
        v81 = self->_distanceCalculator;
        v82 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v7, "coordinate");
        v84 = v83;
        objc_msgSend(v7, "coordinate");
        v86 = v85;
        objc_msgSend(v7, "horizontalAccuracy");
        v88 = v87;
        objc_msgSend(v7, "timestamp");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)objc_msgSend(v82, "initWithLatitude:longitude:horizontalUncertainty:date:", v89, v84, v86, v88);
        v91 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend((id)v177[5], "coordinate");
        v93 = v92;
        objc_msgSend((id)v177[5], "coordinate");
        v95 = v94;
        objc_msgSend((id)v177[5], "horizontalAccuracy");
        v97 = v96;
        objc_msgSend((id)v177[5], "timestamp");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (void *)objc_msgSend(v91, "initWithLatitude:longitude:horizontalUncertainty:date:", v98, v93, v95, v97);
        v171 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v81, "distanceFromLocation:toLocation:error:", v90, v99, &v171);
        v57 = v100;
        v101 = v171;

        if (v57 < 150.0 && !v101)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            v153 = v177[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v153;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v57;
            _os_log_debug_impl(&dword_1D1A22000, v102, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: stopLoiLocation %@ and stopBreadcrumb %@ are within %f m, not adding start LOI", buf, 0x20u);
          }

          v7 = 0;
        }

      }
      v103 = (void *)v186[5];
      if (v103 && v6 && v78 > 0.0)
      {
        objc_msgSend(v103, "timestamp");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timestamp");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "timeIntervalSinceDate:", v105);
        v107 = v106;

        if (v107 <= 0.0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
          {
            v152 = v186[5];
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v152;
            _os_log_debug_impl(&dword_1D1A22000, v112, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: startLoiLocation %@ is at or after time of startBreadcrumb %@, not adding start LOI", buf, 0x16u);
          }
          v113 = 0;
          goto LABEL_51;
        }
        v56 = v78 / v107;
        if (v78 / v107 > 25.0)
        {
          v108 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend((id)v186[5], "timestamp");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = (void *)objc_msgSend(v108, "initWithTimeInterval:sinceDate:", v109, v78 / -25.0);

          if (v166)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v166 - 1);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "stopDate");
            v112 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v112 = objc_claimAutoreleasedReturnValue();
          }
          v114 = objc_msgSend(v110, "isOnOrBefore:", v112);
          _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          v115 = objc_claimAutoreleasedReturnValue();
          v116 = os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG);
          if (v114)
          {
            if (v116)
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v110;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v6;
              _os_log_debug_impl(&dword_1D1A22000, v115, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: cannot find plausible start date (candidate %@) for startLoiLocation %@ that satisfies reasonable speed, not adding LOI", buf, 0x16u);
            }

            v113 = 0;
          }
          else
          {
            if (v116)
            {
              objc_msgSend(v6, "timestamp");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v155;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v110;
              _os_log_debug_impl(&dword_1D1A22000, v115, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adjusting startLoiLocation time from %@  to %@", buf, 0x16u);

            }
            v205 = 0u;
            memset(v206, 0, 28);
            v204 = 0u;
            v202 = 0u;
            memset(v203, 0, sizeof(v203));
            v201 = 0u;
            memset(buf, 0, sizeof(buf));
            objc_msgSend(v6, "clientLocation");
            objc_msgSend(v110, "timeIntervalSinceReferenceDate");
            *(_QWORD *)((char *)v203 + 12) = v117;
            v118 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            v197 = v204;
            v198 = v205;
            v199[0] = v206[0];
            *(_OWORD *)((char *)v199 + 12) = *(_OWORD *)((char *)v206 + 12);
            v193 = v201;
            v194 = v202;
            v195 = v203[0];
            v196 = v203[1];
            v191 = *(_OWORD *)buf;
            v192 = *(_OWORD *)&buf[16];
            v113 = objc_msgSend(v118, "initWithClientLocation:", &v191);

          }
          v6 = v110;
LABEL_51:

          v6 = (void *)v113;
        }
      }
      v167 = v6;
      if (!v177[5] || !v7 || v57 <= 0.0)
      {
LABEL_59:
        v127 = v7;
        goto LABEL_73;
      }
      objc_msgSend(v7, "timestamp", v56);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v177[5], "timestamp");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "timeIntervalSinceDate:", v120);
      v122 = v121;

      if (v122 <= 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
        {
          v154 = v177[5];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v154;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v7;
          _os_log_debug_impl(&dword_1D1A22000, v126, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: stopBreadcrumb %@ is at or after time of stopLoiLocation %@, not adding start LOI", buf, 0x16u);
        }
        v127 = 0;
      }
      else
      {
        if (v57 / v122 <= 25.0)
          goto LABEL_59;
        v123 = objc_alloc(MEMORY[0x1E0C99D68]);
        objc_msgSend((id)v177[5], "timestamp");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)objc_msgSend(v123, "initWithTimeInterval:sinceDate:", v124, v57 / 25.0);

        if (v166 == -[NSMutableArray count](self->_tripSegmentTransitions, "count") - 1)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v126 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_tripSegmentTransitions, "objectAtIndexedSubscript:", v166 + 1);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "startDate");
          v126 = objc_claimAutoreleasedReturnValue();

        }
        v129 = objc_msgSend(v125, "isOnOrAfter:", v126);
        _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        v130 = objc_claimAutoreleasedReturnValue();
        v131 = os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG);
        if (v129)
        {
          if (v131)
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v125;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            _os_log_debug_impl(&dword_1D1A22000, v130, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: cannot find plausible stop date (candidate %@) for startLoiLocation %@ that satisfies reasonable speed, not adding LOI", buf, 0x16u);
          }

          v127 = 0;
        }
        else
        {
          if (v131)
          {
            objc_msgSend(v7, "timestamp");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v156;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v125;
            _os_log_debug_impl(&dword_1D1A22000, v130, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: adjusting stopLoiLocation time from %@  to %@", buf, 0x16u);

          }
          v205 = 0u;
          memset(v206, 0, 28);
          v204 = 0u;
          v202 = 0u;
          memset(v203, 0, sizeof(v203));
          v201 = 0u;
          memset(buf, 0, sizeof(buf));
          objc_msgSend(v7, "clientLocation");
          objc_msgSend(v125, "timeIntervalSinceReferenceDate");
          *(_QWORD *)((char *)v203 + 12) = v132;
          v133 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          v197 = v204;
          v198 = v205;
          v199[0] = v206[0];
          *(_OWORD *)((char *)v199 + 12) = *(_OWORD *)((char *)v206 + 12);
          v193 = v201;
          v194 = v202;
          v195 = v203[0];
          v196 = v203[1];
          v191 = *(_OWORD *)buf;
          v192 = *(_OWORD *)&buf[16];
          v127 = (void *)objc_msgSend(v133, "initWithClientLocation:", &v191);

        }
        v7 = v125;
      }

LABEL_73:
      v134 = [RTLearnedTransition alloc];
      objc_msgSend(v5, "identifier");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      if (v167)
      {
        objc_msgSend(v167, "timestamp");
        v136 = objc_claimAutoreleasedReturnValue();
        v161 = (void *)v136;
        if (!v127)
          goto LABEL_77;
      }
      else
      {
        objc_msgSend(v5, "startDate");
        v136 = objc_claimAutoreleasedReturnValue();
        v159 = (void *)v136;
        if (!v127)
        {
LABEL_77:
          objc_msgSend(v5, "stopDate");
          v137 = objc_claimAutoreleasedReturnValue();
          v160 = (void *)v137;
          goto LABEL_78;
        }
      }
      objc_msgSend(v127, "timestamp");
      v137 = objc_claimAutoreleasedReturnValue();
      v162 = (void *)v137;
LABEL_78:
      objc_msgSend(v5, "visitIdentifierOrigin");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visitIdentifierDestination");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = -[RTLearnedTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:](v134, "initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDestination:creationDate:expirationDate:predominantMotionActivityType:", v135, v136, v137, v138, v139, v140, v141, objc_msgSend(v5, "predominantMotionActivityType"));

      v143 = v162;
      if (!v127)
        v143 = v160;

      v144 = v161;
      if (!v167)
        v144 = v159;

      _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      v145 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v166;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v142;
        _os_log_debug_impl(&dword_1D1A22000, v145, OS_LOG_TYPE_DEBUG, "RTTripSegmentTransitionPreprocessor: updated _tripSegmentTransitions[%tu] to, %@", buf, 0x16u);
      }

      -[NSMutableArray setObject:atIndexedSubscript:](self->_tripSegmentTransitions, "setObject:atIndexedSubscript:", v142, v166);
      v146 = -[TransitionStartStopLocations initWithStartLocation:stopLocation:]([TransitionStartStopLocations alloc], "initWithStartLocation:stopLocation:", v167, v127);
      v147 = self->_transitionStartStopLocations;
      objc_msgSend(v5, "identifier");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "UUIDString");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setValue:forKey:](v147, "setValue:forKey:", v146, v149);

      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(&v185, 8);

      v150 = -[NSMutableArray count](self->_tripSegmentTransitions, "count");
      v4 = v166 + 1;
    }
    while (v166 + 1 < v150);
  }
}

void __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__RTTripSegmentTransitionPreprocessor_adjustTransitionEndpoints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!a3 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "lastObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSMutableDictionary)transitionStartStopLocations
{
  return self->_transitionStartStopLocations;
}

- (NSMutableArray)tripSegmentTransitions
{
  return self->_tripSegmentTransitions;
}

- (void)setTripSegmentTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentTransitions, a3);
}

- (NSMutableArray)tripSegmentVisitStatus
{
  return self->_tripSegmentVisitStatus;
}

- (void)setTripSegmentVisitStatus:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentVisitStatus, a3);
}

- (NSMutableArray)tripSegmentTransitionStatus
{
  return self->_tripSegmentTransitionStatus;
}

- (void)setTripSegmentTransitionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentTransitionStatus, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (RTElevationAdjuster)elevationAdjuster
{
  return self->_elevationAdjuster;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_elevationAdjuster, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentTransitionStatus, 0);
  objc_storeStrong((id *)&self->_tripSegmentVisitStatus, 0);
  objc_storeStrong((id *)&self->_tripSegmentTransitions, 0);
  objc_storeStrong((id *)&self->_transitionStartStopLocations, 0);
}

@end
