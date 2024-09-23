@implementation RTVisitPipelineModuleSmoother

- (RTVisitPipelineModuleSmoother)initWithTimeIntervalBetweenSmoothedPoints:(double)a3 kernelWidth:(double)a4 smallestSignificantWeightExponent:(double)a5 maxGapWithinVisit:(double)a6
{
  RTVisitPipelineModuleSmoother *v6;
  RTVisitPipelineModuleSmoother *v11;
  RTVisitPipelineModuleSmoother *v12;
  RTVisit *workingVisit;
  NSDate *previousProcessedDate;
  NSDate *nextDateToProcess;
  NSDate *firstDateToProcessForVisit;
  RTVisitPipelineModuleSmoother *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v6 = self;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: timeIntervalBetweenSmoothedPoints > 0";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: kernelWidth > 0";
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTVisitPipelineModuleSmoother;
  v11 = -[RTVisitPipelineModuleSmoother init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    workingVisit = v11->_workingVisit;
    v11->_workingVisit = 0;

    previousProcessedDate = v12->_previousProcessedDate;
    v12->_previousProcessedDate = 0;

    nextDateToProcess = v12->_nextDateToProcess;
    v12->_nextDateToProcess = 0;

    firstDateToProcessForVisit = v12->_firstDateToProcessForVisit;
    v12->_firstDateToProcessForVisit = 0;

    v12->_timeIntervalBetweenSmoothedPoints = a3;
    v12->_kernelWidth = a4;
    v12->_smallestSignificantWeightExponent = a5;
    v12->_maxGapInVisit = a6;
  }
  v6 = v12;
  v17 = v6;
LABEL_10:

  return v17;
}

+ (unint64_t)findIndexOfLocationInArray:(id)a3 inRange:(_NSRange)a4 afterDate:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;

  length = a4.length;
  location = a4.location;
  v8 = (objc_class *)MEMORY[0x1E0D183B0];
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithLatitude:longitude:horizontalUncertainty:date:", v9, 0.0, 0.0, 0.0);

  v12 = objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v11, location, length, 1024, &__block_literal_global_44);
  return v12;
}

uint64_t __78__RTVisitPipelineModuleSmoother_findIndexOfLocationInArray_inRange_afterDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (double)getMaxDeltaForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend((id)objc_opt_class(), "findIndexOfLocationInArray:inRange:afterDate:", v8, 0, objc_msgSend(v8, "count"), v7);
  if (v9 >= objc_msgSend(v8, "count"))
  {
    --v9;
  }
  else if (v9)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v11);
    v13 = fabs(v12);
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v15);
    v17 = fabs(v16);

    if (v13 >= v17)
      --v9;
  }
  v18 = (void *)objc_opt_class();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getWeightExponentForSmoothedLocationDate:rawLocationDate:kernelWidth:maxDelta:", v7, v20, a5, 0.0);
  v22 = v21;

  return v22;
}

+ (double)getWeightExponentForSmoothedLocationDate:(id)a3 rawLocationDate:(id)a4 kernelWidth:(double)a5 maxDelta:(double)a6
{
  double v8;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  return v8 / a5 * (v8 / a5) * -0.5 - a6;
}

+ (double)getTimeDeltaSignificanceThresholdForSmoothedLocationDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantaWeightExponent:(double)a6
{
  id v9;
  id v10;
  NSObject *v11;
  double v12;
  double v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (a6 > 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "+[RTVisitPipelineModuleSmoother getTimeDeltaSignificanceThresholdForSmoothedLocationDate:rawLocations:kernel"
            "Width:smallestSignificantaWeightExponent:]";
      v17 = 1024;
      v18 = 98;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "smallestSignificantWeightExponent must be non-positive (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "getMaxDeltaForSmoothedLocationDate:rawLocations:kernelWidth:", v9, v10, a5);
  v13 = v12;

  return sqrt((v13 + a6) * -2.0) * a5;
}

- (id)computeSmoothedPointForDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "computeSmoothedPointForDate:rawLocations:kernelWidth:smallestSignificantWeightExponent:", v4, self->_rawLocations, self->_kernelWidth, self->_smallestSignificantWeightExponent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)computeSmoothedPointForDate:(id)a3 rawLocations:(id)a4 kernelWidth:(double)a5 smallestSignificantWeightExponent:(double)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  long double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  __complex_double v39;
  const char *v40;
  uint8_t *v41;
  NSObject *v42;
  void *v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int16 v56;
  __int16 v57;
  __int16 v58;
  uint8_t buf[2];
  __int16 v60;
  __int16 v61;
  __complex_double v62;
  __complex_double v63;

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v10, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v61 = 0;
    v40 = "Invalid parameter not satisfying: rawLocations.count > 0";
    v41 = (uint8_t *)&v61;
LABEL_31:
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, v40, v41, 2u);
    goto LABEL_24;
  }
  objc_msgSend((id)objc_opt_class(), "getMaxDeltaForSmoothedLocationDate:rawLocations:kernelWidth:", v9, v10, a5);
  v12 = v11;
  objc_msgSend((id)objc_opt_class(), "getTimeDeltaSignificanceThresholdForSmoothedLocationDate:rawLocations:kernelWidth:smallestSignificantaWeightExponent:", v9, v10, a5, a6);
  v14 = v13;
  v15 = (void *)objc_opt_class();
  v16 = objc_msgSend(v10, "count");
  objc_msgSend(v9, "dateByAddingTimeInterval:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "findIndexOfLocationInArray:inRange:afterDate:", v10, 0, v16, v17);

  v19 = (void *)objc_opt_class();
  v20 = objc_msgSend(v10, "count");
  objc_msgSend(v9, "dateByAddingTimeInterval:", -v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "findIndexOfLocationInArray:inRange:afterDate:", v10, 0, v20, v21);

  if (v22 == v18)
  {
    if (v18 + 1 >= objc_msgSend(v10, "count"))
      v23 = v18;
    else
      v23 = v18 + 1;
    if (v18)
      v22 = v18 - 1;
    else
      v22 = 0;
    v18 = v23;
  }
  if (v22 >= v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v60 = 0;
    v40 = "Invalid parameter not satisfying: significantRawLocationsLowerBoundIncludedIndex < significantRawLocationsUppe"
          "rBoundExcludedIndex";
    v41 = (uint8_t *)&v60;
    goto LABEL_31;
  }
  v53 = 3.14159265;
  v52 = 180.0;
  v54 = 0.0;
  v55 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  do
  {
    v26 = (void *)objc_opt_class();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "getWeightExponentForSmoothedLocationDate:rawLocationDate:kernelWidth:maxDelta:", v9, v28, a5, v12);
    v30 = v29;

    if (v30 > a6)
    {
      v31 = pow(2.71828183, v30);
      v32 = fabs(v31);
      if (v32 >= INFINITY && v32 <= INFINITY)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v40 = "Invalid parameter not satisfying: !isinf(weight) && !isnan(weight)";
          v41 = buf;
          goto LABEL_31;
        }
        goto LABEL_24;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", v22, *(_QWORD *)&v52, *(_QWORD *)&v53);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "latitude");
      v35 = v34;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v22);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "longitude");
      v38 = v37 * v53 / v52;
      v62.c[0] = v38 * 0.0;
      v62.c[1] = v38 + 0.0;
      v54 = v54 + v31;
      v25 = v25 + v31 * v35;
      v39 = cexp(v62);
      v24 = v24 + v31 * v39.c[0];
      v55 = v55 + v31 * v39.c[1];

    }
    ++v22;
  }
  while (v18 != v22);
  v63.c[1] = v55;
  v46 = v25 / v54;
  v63.c[0] = v24;
  v47 = carg(v63);
  v48 = fabs(v46);
  if (v48 >= INFINITY && v48 <= INFINITY)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v58 = 0;
    v40 = "Invalid parameter not satisfying: !isinf(meanLat) && !isnan(meanLat)";
    v41 = (uint8_t *)&v58;
    goto LABEL_31;
  }
  v49 = v47 * v52 / v53;
  v50 = fabs(v49);
  if (v50 >= INFINITY && v50 <= INFINITY)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v57 = 0;
    v40 = "Invalid parameter not satisfying: !isinf(meanLong) && !isnan(meanLong)";
    v41 = (uint8_t *)&v57;
    goto LABEL_31;
  }
  RTCommonIsCoordinateValid();
  if (v51 != 0.0)
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", v9, v46, v49, 0.0);
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v56 = 0;
    v40 = "Invalid parameter not satisfying: RTCommonIsCoordinateValid(meanLat, meanLong)";
    v41 = (uint8_t *)&v56;
    goto LABEL_31;
  }
LABEL_24:

  v44 = 0;
LABEL_25:

  return v44;
}

+ (id)getNextDateToProcessForDate:(id)a3 firstDateToProcessForVisit:(id)a4 timeIntervalBetweenSmoothedPoints:(double)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a4;
  v8 = v7;
  if (a3)
  {
    objc_msgSend(a3, "dateByAddingTimeInterval:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)getNextDateToProcessForDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "getNextDateToProcessForDate:firstDateToProcessForVisit:timeIntervalBetweenSmoothedPoints:", v4, self->_firstDateToProcessForVisit, self->_timeIntervalBetweenSmoothedPoints);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)disposeObsoleteRawLocations:(id)a3 currentDateToProcess:(id)a4 halfTimeProcessWindow:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v9 = objc_msgSend(v12, "count");
  objc_msgSend(v7, "dateByAddingTimeInterval:", -a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "findIndexOfLocationInArray:inRange:afterDate:", v12, 0, v9, v10);
  if (v11)
    objc_msgSend(v12, "removeObjectsInRange:", 0, v11);

}

- (void)disposeObsoleteRawLocationsForCurrentDateToProcess:(id)a3 halfTimeProcessWindow:(double)a4
{
  id v6;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "disposeObsoleteRawLocations:currentDateToProcess:halfTimeProcessWindow:", self->_rawLocations, v6, a4);

}

- (id)createNewOutputClusterForSmoothedPoints:(id)a3 exit:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "createNewOutputClusterForSmoothedPoints:workingVisit:exit:", v7, self->_workingVisit, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeAllObjects");
  return v8;
}

+ (id)createNewOutputClusterForSmoothedPoints:(id)a3 workingVisit:(id)a4 exit:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  RTVisitCluster *v17;
  RTVisitLocationPoints *v18;
  RTVisitCluster *v19;

  v7 = (objc_class *)MEMORY[0x1E0D18578];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [v7 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v13 = 3;
  else
    v13 = 1;
  objc_msgSend(v9, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v11, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v12, v13, v14, v15, v8, objc_msgSend(v10, "count"), 1.0, 0);
  v17 = [RTVisitCluster alloc];
  v18 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", v10);

  v19 = -[RTVisitCluster initWithPoints:visit:](v17, "initWithPoints:visit:", v18, v16);
  return v19;
}

+ (id)getEndOfGapAtDate:(id)a3 rawLocations:(id)a4 maxGapWithinVisit:(double)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend((id)objc_opt_class(), "findIndexOfLocationInArray:inRange:afterDate:", v8, 0, objc_msgSend(v8, "count"), v7);
  if (!v9)
  {
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v7);
      v17 = v16;

      if (v17 > a5)
      {
        v18 = v8;
        v19 = 0;
        goto LABEL_11;
      }
    }
  }
  v10 = objc_msgSend(v8, "count");
  v11 = 0;
  if (v9 && v9 < v10)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToDate:", v7))
    {

      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v23);
    v25 = v24;

    if (v25 <= a5)
    {
      v11 = 0;
      goto LABEL_13;
    }
    v18 = v8;
    v19 = v9;
LABEL_11:
    objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (id)getEndOfGapAtDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "getEndOfGapAtDate:rawLocations:maxGapWithinVisit:", v4, self->_rawLocations, self->_maxGapInVisit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)hasRawLocationsNeededToComputeSmoothedLocationAtDate:(id)a3 workingVisitExit:(id)a4 rawLocations:(id)a5 kernelWidth:(double)a6 smallestSignificantWeightExponent:(double)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v11 = a5;
  v12 = a3;
  v13 = v12;
  if (a4)
  {
    objc_msgSend(v12, "earlierDate:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToDate:", v13);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "getTimeDeltaSignificanceThresholdForSmoothedLocationDate:rawLocations:kernelWidth:smallestSignificantaWeightExponent:", v12, v11, a6, a7);
    objc_msgSend(v13, "dateByAddingTimeInterval:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "earlierDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "isEqualToDate:", v14);

  }
  return v15;
}

- (id)processCachedPoints
{
  NSObject *v3;
  id v4;
  NSDate *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *entryBeforeAnyGaps;
  void *v13;
  NSDate *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSDate *nextDateToProcess;
  void *v19;
  RTVisit *v20;
  RTVisit *workingVisit;
  NSDate *previousProcessedDate;
  NSDate *v23;
  NSDate *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "Begin processCachedPoints", buf, 2u);
  }

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTVisitPipelineModuleSmoother getNextDateToProcessForDate:](self, "getNextDateToProcessForDate:", self->_previousProcessedDate);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v6 = (void *)objc_opt_class();
    -[RTVisit exit](self->_workingVisit, "exit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "hasRawLocationsNeededToComputeSmoothedLocationAtDate:workingVisitExit:rawLocations:kernelWidth:smallestSignificantWeightExponent:", v5, v7, self->_rawLocations, self->_kernelWidth, self->_smallestSignificantWeightExponent);

    if (!(_DWORD)v6)
      break;
    -[RTVisitPipelineModuleSmoother getEndOfGapAtDate:](self, "getEndOfGapAtDate:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (uint64_t)v8;
        _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "gap detected, endOfGap=%@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_nextDateToProcess, v8);
      if (objc_msgSend(v4, "count"))
      {
        -[RTVisitPipelineModuleSmoother createNewOutputClusterForSmoothedPoints:exit:](self, "createNewOutputClusterForSmoothedPoints:exit:", v4, self->_previousProcessedDate);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v10);

        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v35, "lastObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = (uint64_t)v25;
          _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "adding visit=%@", buf, 0xCu);

        }
      }
      -[RTVisit exit](self->_workingVisit, "exit");
      entryBeforeAnyGaps = (void *)objc_claimAutoreleasedReturnValue();
      if (entryBeforeAnyGaps)
      {
LABEL_13:

      }
      else if (!self->_entryBeforeAnyGaps)
      {
        -[RTVisit entry](self->_workingVisit, "entry");
        v24 = (NSDate *)objc_claimAutoreleasedReturnValue();
        entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
        self->_entryBeforeAnyGaps = v24;
        goto LABEL_13;
      }
      v16 = objc_alloc(MEMORY[0x1E0D18578]);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[RTVisit type](self->_workingVisit, "type");
      -[RTVisit location](self->_workingVisit, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      nextDateToProcess = self->_nextDateToProcess;
      -[RTVisit exit](self->_workingVisit, "exit");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (RTVisit *)objc_msgSend(v16, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v13, v17, v15, nextDateToProcess, v19, 0, 1.0, 0);
      workingVisit = self->_workingVisit;
      self->_workingVisit = v20;

      goto LABEL_19;
    }
    -[RTVisitPipelineModuleSmoother computeSmoothedPointForDate:](self, "computeSmoothedPointForDate:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "addObject:", v13);
    -[RTVisitPipelineModuleSmoother getNextDateToProcessForDate:](self, "getNextDateToProcessForDate:", v5);
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v15 = self->_nextDateToProcess;
    self->_nextDateToProcess = v14;
LABEL_19:

    previousProcessedDate = self->_previousProcessedDate;
    self->_previousProcessedDate = v5;
    v23 = v5;

    v5 = self->_nextDateToProcess;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v33 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v37 = v33;
    _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "Finished generating %lu smoothed points.", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[RTVisit exit](self->_workingVisit, "exit");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitPipelineModuleSmoother createNewOutputClusterForSmoothedPoints:exit:](self, "createNewOutputClusterForSmoothedPoints:exit:", v4, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v28);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v35, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = (uint64_t)v34;
      _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "adding visit=%@", buf, 0xCu);

    }
  }
  -[RTVisit exit](self->_workingVisit, "exit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[RTVisitPipelineModuleSmoother resetState](self, "resetState");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "getTimeDeltaSignificanceThresholdForSmoothedLocationDate:rawLocations:kernelWidth:smallestSignificantaWeightExponent:", v5, self->_rawLocations, self->_kernelWidth, self->_smallestSignificantWeightExponent);
    -[RTVisitPipelineModuleSmoother disposeObsoleteRawLocationsForCurrentDateToProcess:halfTimeProcessWindow:](self, "disposeObsoleteRawLocationsForCurrentDateToProcess:halfTimeProcessWindow:", v5);
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, "End processCachedPoints", buf, 2u);
  }

  return v35;
}

- (void)resetState
{
  RTVisit *workingVisit;
  NSDate *entryBeforeAnyGaps;
  NSMutableArray *rawLocations;
  RTVisit *v6;
  NSDate *firstDateToProcessForVisit;
  NSDate *previousProcessedDate;

  workingVisit = self->_workingVisit;
  self->_workingVisit = 0;

  entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
  self->_entryBeforeAnyGaps = 0;

  rawLocations = self->_rawLocations;
  self->_rawLocations = 0;

  v6 = self->_workingVisit;
  self->_workingVisit = 0;

  firstDateToProcessForVisit = self->_firstDateToProcessForVisit;
  self->_firstDateToProcessForVisit = 0;

  previousProcessedDate = self->_previousProcessedDate;
  self->_previousProcessedDate = 0;

}

- (void)updateStateWithNewCluster:(id)a3
{
  id v4;
  RTVisit *workingVisit;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *firstDateToProcessForVisit;
  id v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  NSDate *entryBeforeAnyGaps;
  void *v20;
  void *v21;
  NSMutableArray *rawLocations;
  RTVisit *v23;
  RTVisit *v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  workingVisit = self->_workingVisit;
  if (workingVisit)
  {
    -[RTVisit entry](workingVisit, "entry");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToDate:](v6, "isEqualToDate:", v8))
    {

    }
    else
    {
      entryBeforeAnyGaps = self->_entryBeforeAnyGaps;
      objc_msgSend(v4, "visit");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entry");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(entryBeforeAnyGaps) = -[NSDate isEqualToDate:](entryBeforeAnyGaps, "isEqualToDate:", v21);

      if ((entryBeforeAnyGaps & 1) != 0)
      {
LABEL_9:
        rawLocations = self->_rawLocations;
        objc_msgSend(v4, "points");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "locations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](rawLocations, "addObjectsFromArray:", v16);
        goto LABEL_10;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v25 = 136315394;
        v26 = "-[RTVisitPipelineModuleSmoother updateStateWithNewCluster:]";
        v27 = 1024;
        v28 = 405;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Partial visit not closed before starting new visit. (in %s:%d)", (uint8_t *)&v25, 0x12u);
      }
    }

    goto LABEL_9;
  }
  objc_msgSend(v4, "points");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "date");
  v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
  firstDateToProcessForVisit = self->_firstDateToProcessForVisit;
  self->_firstDateToProcessForVisit = v12;

  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "points");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSMutableArray *)objc_msgSend(v14, "initWithArray:copyItems:", v16, 0);
  v18 = self->_rawLocations;
  self->_rawLocations = v17;

LABEL_10:
  objc_msgSend(v4, "visit");
  v23 = (RTVisit *)objc_claimAutoreleasedReturnValue();
  v24 = self->_workingVisit;
  self->_workingVisit = v23;

}

- (id)process:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "Begin smoothing", buf, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v12;
          _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "working on cluster=%@", buf, 0xCu);
        }

        -[RTVisitPipelineModuleSmoother updateStateWithNewCluster:](self, "updateStateWithNewCluster:", v12);
        -[RTVisitPipelineModuleSmoother processCachedPoints](self, "processCachedPoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v9);
  }

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "End smoothing", buf, 2u);
  }

  return v6;
}

- (NSDate)previousProcessedDate
{
  return self->_previousProcessedDate;
}

- (NSDate)nextDateToProcess
{
  return self->_nextDateToProcess;
}

- (NSDate)firstDateToProcessForVisit
{
  return self->_firstDateToProcessForVisit;
}

- (double)timeIntervalBetweenSmoothedPoints
{
  return self->_timeIntervalBetweenSmoothedPoints;
}

- (double)kernelWidth
{
  return self->_kernelWidth;
}

- (double)smallestSignificantWeightExponent
{
  return self->_smallestSignificantWeightExponent;
}

- (double)maxGapInVisit
{
  return self->_maxGapInVisit;
}

- (unint64_t)leftWindowIncludedIndex
{
  return self->_leftWindowIncludedIndex;
}

- (unint64_t)rightWindowExcludedIndex
{
  return self->_rightWindowExcludedIndex;
}

- (unint64_t)outputLocationsCount
{
  return self->_outputLocationsCount;
}

- (NSMutableArray)rawLocations
{
  return self->_rawLocations;
}

- (RTVisit)workingVisit
{
  return self->_workingVisit;
}

- (NSDate)entryBeforeAnyGaps
{
  return self->_entryBeforeAnyGaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryBeforeAnyGaps, 0);
  objc_storeStrong((id *)&self->_workingVisit, 0);
  objc_storeStrong((id *)&self->_rawLocations, 0);
  objc_storeStrong((id *)&self->_firstDateToProcessForVisit, 0);
  objc_storeStrong((id *)&self->_nextDateToProcess, 0);
  objc_storeStrong((id *)&self->_previousProcessedDate, 0);
}

@end
