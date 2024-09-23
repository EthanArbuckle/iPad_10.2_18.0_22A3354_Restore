@implementation RTSignalGenerator

- (RTSignalGenerator)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithSignalGeneratorOptions_locationManager_generatedLocations_);
}

- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4
{
  return -[RTSignalGenerator initWithSignalGeneratorOptions:locationManager:generatedLocations:](self, "initWithSignalGeneratorOptions:locationManager:generatedLocations:", a3, a4, 0);
}

- (RTSignalGenerator)initWithSignalGeneratorOptions:(id)a3 locationManager:(id)a4 generatedLocations:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTSignalGenerator *v12;
  RTSignalGenerator *v13;
  uint64_t v14;
  NSMutableArray *generatedLocations;
  RTSignalGenerator *v16;
  NSObject *v17;
  const char *v18;
  objc_super v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v16 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: signalGeneratorOptions";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_12;
  }
  v20.receiver = self;
  v20.super_class = (Class)RTSignalGenerator;
  v12 = -[RTSignalGenerator init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signalGeneratorOptions, a3);
    objc_storeStrong((id *)&v13->_locationManager, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    generatedLocations = v13->_generatedLocations;
    v13->_generatedLocations = (NSMutableArray *)v14;

    v13->_totalVisitLocationsGeneratedCount = 0;
    v13->_totalTransitionLocationsGeneratedCount = 0;
  }
  self = v13;
  v16 = self;
LABEL_10:

  return v16;
}

- (unint64_t)locationCountInStoreWithError:(id *)a3
{
  NSObject *v5;
  dispatch_semaphore_t v6;
  RTLocationManager *locationManager;
  void *v8;
  void *v9;
  NSObject *v10;
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
  id v26;
  char v27;
  id v28;
  unint64_t v29;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint8_t buf[8];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v39 = 136315394;
      *(_QWORD *)&v39[4] = "-[RTSignalGenerator locationCountInStoreWithError:]";
      *(_WORD *)&v39[12] = 1024;
      *(_DWORD *)&v39[14] = 74;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError (in %s:%d)", v39, 0x12u);
    }

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  *(_QWORD *)v39 = 0;
  *(_QWORD *)&v39[8] = v39;
  *(_QWORD *)&v39[16] = 0x3032000000;
  v40 = __Block_byref_object_copy__130;
  v41 = __Block_byref_object_dispose__130;
  v42 = 0;
  v6 = dispatch_semaphore_create(0);
  locationManager = self->_locationManager;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __51__RTSignalGenerator_locationCountInStoreWithError___block_invoke;
  v31[3] = &unk_1E92971F0;
  v33 = &v35;
  v34 = v39;
  v10 = v6;
  v32 = v10;
  -[RTLocationManager fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:](locationManager, "fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:", v8, v9, -1, v31, 1.79769313e308);

  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_100);
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
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v43 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v43, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_10:
    v26 = 0;
    v27 = 1;
  }

  v28 = v26;
  if ((v27 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)&v39[8] + 40), v26);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&v39[8] + 40));
  v29 = v36[3];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v35, 8);
  return v29;
}

void __51__RTSignalGenerator_locationCountInStoreWithError___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (double)minSpeedToFilterHyperParameter
{
  void *v2;
  uint64_t v3;
  void *v4;
  double result;

  v2 = (void *)hyperParameter;
  if (!hyperParameter)
  {
    v3 = objc_opt_new();
    v4 = (void *)hyperParameter;
    hyperParameter = v3;

    v2 = (void *)hyperParameter;
  }
  objc_msgSend(v2, "minSpeedToFilter");
  return result;
}

+ (double)perpendicularAngleForAngle:(double)a3
{
  double result;

  result = a3 + 1.57079633;
  if (result > 6.28318531)
    return result + -6.28318531;
  return result;
}

+ (double)anglePerpendicularToLineBetweenLocation1:(id)a3 location2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double result;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "coordinate");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "coordinate");
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "angleOfLineBetweenCoordinate1:coordinate2:", v9, v11, v13, v15);
  objc_msgSend((id)objc_opt_class(), "perpendicularAngleForAngle:", v16);
  return result;
}

+ (double)angleOfLineBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  double v4;
  double v5;
  double result;
  double v7;

  v4 = a4.latitude - a3.latitude;
  v5 = a4.longitude - a3.longitude;
  if (a4.longitude - a3.longitude == 0.0)
  {
    if (v4 <= 0.0)
    {
      result = 4.71238898;
      if (v4 == 0.0)
        return 0.0;
    }
    else
    {
      return 1.57079633;
    }
  }
  else
  {
    if (v4 != 0.0)
    {
      result = atan(v4 / v5);
      if ((v5 >= 0.0 || v4 >= 0.0) && v5 >= 0.0)
      {
        if (v4 >= 0.0)
          return result;
        v7 = 6.28318531;
      }
      else
      {
        v7 = 3.14159265;
      }
      return result + v7;
    }
    result = 3.14159265;
    if (v5 >= 0.0)
      return 0.0;
  }
  return result;
}

+ (double)angleSweptFromStartAngle:(double)a3 ToEndAngle:(double)a4
{
  if (a4 <= a3)
    a4 = a4 + 6.28318531;
  return a4 - a3;
}

+ (double)arcDistanceForStartLocation:(id)a3 endLocation:(id)a4 centerLocation:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
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

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  v11 = (void *)objc_opt_class();
  objc_msgSend(v7, "coordinate");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v11, "angleOfLineBetweenCoordinate1:coordinate2:", v13, v15, v16, v17);
  v19 = v18;
  v20 = (void *)objc_opt_class();
  objc_msgSend(v7, "coordinate");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v8, "coordinate");
  v26 = v25;
  v28 = v27;

  objc_msgSend(v20, "angleOfLineBetweenCoordinate1:coordinate2:", v22, v24, v26, v28);
  objc_msgSend(v10, "angleSweptFromStartAngle:ToEndAngle:", v19, v29);
  v31 = v30;
  objc_msgSend(v9, "distanceFromLocation:", v7);
  v33 = v32;

  return fabs(v31 * v33);
}

+ (double)latLongDisplacementBetweenCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  return fabs(sqrt((a3.latitude - a4.latitude) * (a3.latitude - a4.latitude)+ (a3.longitude - a4.longitude) * (a3.longitude - a4.longitude)));
}

+ (CLLocationCoordinate2D)averageCoordinateOfCoordinate1:(CLLocationCoordinate2D)a3 coordinate2:(CLLocationCoordinate2D)a4
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D v6;
  CLLocationCoordinate2D result;

  v6 = CLLocationCoordinate2DMake((a3.latitude + a4.latitude) * 0.5, (a3.longitude + a4.longitude) * 0.5);
  longitude = v6.longitude;
  latitude = v6.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

+ (CLLocationCoordinate2D)coordinateAtDisplacement:(double)a3 fromCenterCoordinate:(CLLocationCoordinate2D)a4 atAngle:(double)a5
{
  double longitude;
  double latitude;
  __double2 v8;
  double v9;
  double v10;
  CLLocationCoordinate2D v11;
  CLLocationCoordinate2D result;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = __sincos_stret(a5);
  v11 = CLLocationCoordinate2DMake(latitude + a3 * v8.__sinval, longitude + a3 * v8.__cosval);
  v10 = v11.longitude;
  v9 = v11.latitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

+ (id)locationBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 betweenTargetLowLocation:(id)a7 targetHighLocation:(id)a8
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  void *v53;
  double v54;
  double v55;
  id v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  uint8_t buf[4];
  double v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = v16;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
LABEL_27:
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_28;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: upperDistanceBound > 0";
    goto LABEL_27;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: startLocation";
    goto LABEL_27;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_27;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: targetLowLocation";
    goto LABEL_27;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: targetHighLocation";
      goto LABEL_27;
    }
LABEL_28:
    v50 = 0;
    goto LABEL_29;
  }
  v18 = (void *)objc_opt_class();
  -[NSObject coordinate](v17, "coordinate");
  v20 = v19;
  v22 = v21;
  -[NSObject coordinate](v15, "coordinate");
  objc_msgSend(v18, "averageCoordinateOfCoordinate1:coordinate2:", v20, v22, v23, v24);
  v26 = v25;
  v28 = v27;
  v29 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
  v31 = v30 * 1.5;
  v32 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v13, "timestamp");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timestamp");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "dateBisectingDate1:date2:", v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v29, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v35, v26, v28, 0.0, 10.0, 10.0, 0.0, v31);

  objc_msgSend((id)objc_opt_class(), "arcDistanceForStartLocation:endLocation:centerLocation:", v13, v14, v36);
  if (v37 <= a3)
  {
    v53 = (void *)objc_opt_class();
    v54 = a3;
    v55 = a4;
    v56 = v13;
    v57 = v14;
    v58 = v36;
    v59 = v17;
LABEL_32:
    objc_msgSend(v53, "locationBetweenLowerDistanceBound:upperDistanceBound:fromStartLocation:endLocation:betweenTargetLowLocation:targetHighLocation:", v56, v57, v58, v59, v54, v55);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v38 = v37;
  if (v37 >= a4)
  {
    v53 = (void *)objc_opt_class();
    v54 = a3;
    v55 = a4;
    v56 = v13;
    v57 = v14;
    v58 = v15;
    v59 = v36;
    goto LABEL_32;
  }
  RTCommonIsCoordinateValid();
  if (v39 == 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v63 = v26;
      v64 = 2048;
      v65 = v28;
      _os_log_debug_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_DEBUG, "Invalid Coords: %lf, %lf", buf, 0x16u);
    }

  }
  RTCommonIsCoordinateValid();
  if (v41 == 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(midCoordinate.latitude, midCoordinate.longitude)", buf, 2u);
    }

    goto LABEL_28;
  }
  v42 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v14, "timestamp");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "timeIntervalSinceDate:", v43);
  v44 = (void *)MEMORY[0x1E0C99D68];
  v46 = v38 / v45;
  objc_msgSend(v13, "timestamp");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timestamp");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "dateBisectingDate1:date2:", v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v42, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v49, v26, v28, 0.0, 10.0, 10.0, 0.0, v46);

LABEL_29:
  return v50;
}

+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 fromStartLocation:(id)a5 endLocation:(id)a6 examiningLatLongDisplacement:(double)a7 fromIntersectingLocation:(id)a8 atAngle:(double)a9
{
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  double v46;
  double v47;
  NSObject *v48;
  double v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  double v62;
  __int16 v63;
  double v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v18 = v17;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    LOWORD(v61) = 0;
    v43 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v61, 2u);
    goto LABEL_21;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    LOWORD(v61) = 0;
    v43 = "Invalid parameter not satisfying: upperDistanceBound > 0";
    goto LABEL_20;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    LOWORD(v61) = 0;
    v43 = "Invalid parameter not satisfying: startLocation";
    goto LABEL_20;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    LOWORD(v61) = 0;
    v43 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_20;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    LOWORD(v61) = 0;
    v43 = "Invalid parameter not satisfying: intersectingLocation";
    goto LABEL_20;
  }
  v19 = (void *)objc_opt_class();
  -[NSObject coordinate](v18, "coordinate");
  objc_msgSend(v19, "coordinateAtDisplacement:fromCenterCoordinate:atAngle:", a7, v20, v21, a9);
  v23 = v22;
  v25 = v24;
  v26 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
  v28 = v27 * 1.5;
  v29 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v15, "timestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timestamp");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dateBisectingDate1:date2:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v26, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v32, v23, v25, 0.0, 10.0, 10.0, 0.0, v28);

  objc_msgSend((id)objc_opt_class(), "arcDistanceForStartLocation:endLocation:centerLocation:", v15, v16, v33);
  if (v34 <= a3)
  {
    if (a7 >= 0.0)
    {
      v36 = (void *)objc_opt_class();
      if (a7 != 0.0)
      {
        v37 = a3;
        v38 = a4;
        v39 = v15;
        v40 = v16;
        v41 = v33;
        v42 = v18;
        goto LABEL_41;
      }
      v46 = -0.1;
LABEL_36:
      objc_msgSend(v36, "centerProducingArcBetweenLowerDistanceBound:upperDistanceBound:fromStartLocation:endLocation:examiningLatLongDisplacement:fromIntersectingLocation:atAngle:", v15, v16, v18, a3, a4, v46, a9);
      v59 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v44 = (void *)v59;
      goto LABEL_22;
    }
    v36 = (void *)objc_opt_class();
LABEL_25:
    v46 = a7 + a7;
    goto LABEL_36;
  }
  v35 = v34;
  if (v34 > a4)
  {
    if (a7 < 0.0)
    {
      v36 = (void *)objc_opt_class();
      v37 = a3;
      v38 = a4;
      v39 = v15;
      v40 = v16;
      v41 = v18;
      v42 = v33;
LABEL_41:
      objc_msgSend(v36, "locationBetweenLowerDistanceBound:upperDistanceBound:fromStartLocation:endLocation:betweenTargetLowLocation:targetHighLocation:", v39, v40, v41, v42, v37, v38);
      v59 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    }
    v36 = (void *)objc_opt_class();
    if (a7 == 0.0)
    {
      v46 = 0.1;
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  RTCommonIsCoordinateValid();
  if (v47 == 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v61 = 134218240;
      v62 = v23;
      v63 = 2048;
      v64 = v25;
      _os_log_debug_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_DEBUG, "Invalid Coords: %lf, %lf", (uint8_t *)&v61, 0x16u);
    }

  }
  RTCommonIsCoordinateValid();
  if (v49 != 0.0)
  {
    v50 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v16, "timestamp");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timeIntervalSinceDate:", v52);
    v53 = (void *)MEMORY[0x1E0C99D68];
    v55 = v35 / v54;
    objc_msgSend(v15, "timestamp");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timestamp");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dateBisectingDate1:date2:", v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v50, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v58, v23, v25, 0.0, 10.0, 10.0, 0.0, v55);

    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v61) = 0;
    _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(candidateTargetCoordinate.latitude, candidateTargetCoordinate.longitude)", (uint8_t *)&v61, 2u);
  }

LABEL_21:
  v44 = 0;
LABEL_22:

  return v44;
}

+ (id)centerProducingArcBetweenLowerDistanceBound:(double)a3 upperDistanceBound:(double)a4 FromStartLocation:(id)a5 endLocation:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;

  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v33 = 0;
    v26 = "Invalid parameter not satisfying: lowerDistanceBound > 0";
    v27 = (uint8_t *)&v33;
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
    goto LABEL_18;
  }
  if (a4 <= a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v32 = 0;
    v26 = "Invalid parameter not satisfying: upperDistanceBound > lowerDistanceBound";
    v27 = (uint8_t *)&v32;
    goto LABEL_17;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v31 = 0;
    v26 = "Invalid parameter not satisfying: startLocation";
    v27 = (uint8_t *)&v31;
    goto LABEL_17;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v30 = 0;
    v26 = "Invalid parameter not satisfying: endLocation";
    v27 = (uint8_t *)&v30;
    goto LABEL_17;
  }
  objc_msgSend(v9, "distanceFromLocation:", v10);
  if (v12 >= a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v29 = 0;
      v26 = "Invalid parameter not satisfying: lowerDistanceBound > distance";
      v27 = (uint8_t *)&v29;
      goto LABEL_17;
    }
LABEL_18:

    v24 = 0;
    goto LABEL_19;
  }
  v13 = (void *)objc_opt_class();
  objc_msgSend(v9, "coordinate");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v11, "coordinate");
  objc_msgSend(v13, "averageCoordinateOfCoordinate1:coordinate2:", v15, v17, v18, v19);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v20, v21);
  objc_msgSend((id)objc_opt_class(), "anglePerpendicularToLineBetweenLocation1:location2:", v9, v11);
  objc_msgSend((id)objc_opt_class(), "centerProducingArcBetweenLowerDistanceBound:upperDistanceBound:fromStartLocation:endLocation:examiningLatLongDisplacement:fromIntersectingLocation:atAngle:", v9, v11, v22, a3, a4, 0.0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v24;
}

+ (id)necessaryCenterOfArcBetweenStartLocation:(id)a3 endLocation:(id)a4 minimumSpeed:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    LOWORD(v21) = 0;
    v19 = "Invalid parameter not satisfying: startLocation";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 2u);
    goto LABEL_17;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    LOWORD(v21) = 0;
    v19 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_16;
  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      v19 = "Invalid parameter not satisfying: minimumSpeed > 0";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v8, "distanceFromLocation:", v7);
  v11 = v10;
  objc_msgSend(v9, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "+[RTSignalGenerator necessaryCenterOfArcBetweenStartLocation:endLocation:minimumSpeed:]";
      v23 = 1024;
      v24 = 408;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "endLocation must be strictly after startLocaton (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }

  }
  if (v11 / v15 >= a5)
    goto LABEL_18;
  objc_msgSend((id)objc_opt_class(), "centerProducingArcBetweenLowerDistanceBound:upperDistanceBound:FromStartLocation:endLocation:", v7, v9, v15 * a5, a5 * 1.3 * v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v17;
}

- (id)addGeneratedLocation:(id)a3 forceInject:(BOOL)a4
{
  id v6;
  double v7;
  id *v8;
  unint64_t v9;
  dispatch_semaphore_t v10;
  RTLocationManager *locationManager;
  NSMutableArray *generatedLocations;
  NSObject *v13;
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
  id v28;
  int v29;
  NSObject *v30;
  id v31;
  id v32;
  uint64_t v33;
  id *v34;
  unint64_t v35;
  BOOL v36;
  void *v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  uint8_t *v42;
  id obj;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint8_t v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "coordinate");
  objc_msgSend(v6, "coordinate");
  RTCommonIsCoordinateValid();
  if (v7 == 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTCommonIsCoordinateValid(location.coordinate.latitude, location.coordinate.longitude)", buf, 2u);
    }

    v31 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__130;
    v48 = __Block_byref_object_dispose__130;
    v49 = 0;
    if (v6)
      -[NSMutableArray addObject:](self->_generatedLocations, "addObject:", v6);
    if (a4 || -[NSMutableArray count](self->_generatedLocations, "count") == 625)
    {
      v8 = (id *)(v45 + 40);
      obj = (id)*((_QWORD *)v45 + 5);
      v9 = -[RTSignalGenerator locationCountInStoreWithError:](self, "locationCountInStoreWithError:", &obj);
      objc_storeStrong(v8, obj);
      v10 = dispatch_semaphore_create(0);
      locationManager = self->_locationManager;
      generatedLocations = self->_generatedLocations;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __54__RTSignalGenerator_addGeneratedLocation_forceInject___block_invoke;
      v40[3] = &unk_1E9297038;
      v42 = buf;
      v13 = v10;
      v41 = v13;
      -[RTLocationManager injectLocations:handler:](locationManager, "injectLocations:handler:", generatedLocations, v40);
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v14, v16))
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeIntervalSinceDate:", v15);
      v18 = v17;
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_100);
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
        *(_WORD *)v51 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v51 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_retainAutorelease(v27);

        v29 = 0;
      }
      else
      {
LABEL_14:
        v28 = 0;
        v29 = 1;
      }

      v32 = v28;
      if (!v29)
        objc_storeStrong((id *)v45 + 5, v28);
      v33 = -10;
      do
      {
        v34 = (id *)(v45 + 40);
        v39 = (id)*((_QWORD *)v45 + 5);
        v35 = -[RTSignalGenerator locationCountInStoreWithError:](self, "locationCountInStoreWithError:", &v39);
        objc_storeStrong(v34, v39);
        usleep(0x2710u);
        v36 = __CFADD__(v33++, 1);
      }
      while (!v36 && v35 < -[NSMutableArray count](self->_generatedLocations, "count") + v9);
      -[NSMutableArray removeAllObjects](self->_generatedLocations, "removeAllObjects");

    }
    v31 = *((id *)v45 + 5);
    _Block_object_dispose(buf, 8);

  }
  return v31;
}

void __54__RTSignalGenerator_addGeneratedLocation_forceInject___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  _QWORD v29[6];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: startLocation";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: endLocation";
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
  objc_msgSend((id)objc_opt_class(), "necessaryCenterOfArcBetweenStartLocation:endLocation:minimumSpeed:", v6, v8, v9 * 1.5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    -[RTSignalGenerator transitionLocationsAlongArcBetweenStartLocation:endLocation:forCenterLocation:](self, "transitionLocationsAlongArcBetweenStartLocation:endLocation:forCenterLocation:", v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v16);
    v18 = v17;

    v19 = v18 / 60.0;
    objc_msgSend(v8, "coordinate");
    v21 = v20;
    objc_msgSend(v6, "coordinate");
    v23 = (double)(unint64_t)v19;
    v24 = (v21 - v22) / v23;
    objc_msgSend(v8, "coordinate");
    v26 = v25;
    objc_msgSend(v6, "coordinate");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__RTSignalGenerator_transitionLocationsBetweenStartLocation_endLocation___block_invoke;
    v29[3] = &__block_descriptor_48_e63__CLLocationCoordinate2D_dd_32__0_CLLocationCoordinate2D_dd_8Q24l;
    *(double *)&v29[4] = v24;
    *(double *)&v29[5] = (v26 - v27) / v23;
    v28 = (void *)MEMORY[0x1D8232094](v29);
    -[RTSignalGenerator transitionLocationsBetweenStartLocation:endLocation:coordinateCalculationBlock:](self, "transitionLocationsBetweenStartLocation:endLocation:coordinateCalculationBlock:", v6, v8, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
LABEL_9:

  return v12;
}

double __73__RTSignalGenerator_transitionLocationsBetweenStartLocation_endLocation___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&CLLocationCoordinate2DMake(a3 + (double)a2 * *(double *)(a1 + 32), a4 + (double)a2 * *(double *)(a1 + 40));
  return result;
}

- (id)transitionLocationsAlongArcBetweenStartLocation:(id)a3 endLocation:(id)a4 forCenterLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  double v50;
  double v51;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  v15 = v14 / 60.0;
  v16 = (void *)objc_opt_class();
  objc_msgSend(v8, "coordinate");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v10, "coordinate");
  objc_msgSend(v16, "angleOfLineBetweenCoordinate1:coordinate2:", v18, v20, v21, v22);
  v24 = v23;
  v25 = (void *)objc_opt_class();
  objc_msgSend(v8, "coordinate");
  v27 = v26;
  v29 = v28;
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v25, "angleOfLineBetweenCoordinate1:coordinate2:", v27, v29, v30, v31);
  objc_msgSend((id)objc_opt_class(), "angleSweptFromStartAngle:ToEndAngle:", v24, v32);
  v34 = v33 / (double)(unint64_t)v15;
  v35 = (void *)objc_opt_class();
  objc_msgSend(v10, "coordinate");
  v37 = v36;
  v39 = v38;
  objc_msgSend(v8, "coordinate");
  objc_msgSend(v35, "latLongDisplacementBetweenCoordinate1:coordinate2:", v37, v39, v40, v41);
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __99__RTSignalGenerator_transitionLocationsAlongArcBetweenStartLocation_endLocation_forCenterLocation___block_invoke;
  v47[3] = &unk_1E92A3280;
  v47[4] = self;
  v48 = v8;
  v49 = v42;
  v50 = v24;
  v51 = v34;
  v43 = v8;
  v44 = (void *)MEMORY[0x1D8232094](v47);
  -[RTSignalGenerator transitionLocationsBetweenStartLocation:endLocation:coordinateCalculationBlock:](self, "transitionLocationsBetweenStartLocation:endLocation:coordinateCalculationBlock:", v10, v9, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

uint64_t __99__RTSignalGenerator_transitionLocationsAlongArcBetweenStartLocation_endLocation_forCenterLocation___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_opt_class();
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "coordinate");
  return objc_msgSend(v4, "coordinateAtDisplacement:fromCenterCoordinate:atAngle:", v5, v6, v7, *(double *)(a1 + 56) + (double)a2 * *(double *)(a1 + 64));
}

- (id)transitionLocationsBetweenStartLocation:(id)a3 endLocation:(id)a4 coordinateCalculationBlock:(id)a5
{
  id v8;
  id v9;
  double (**v10)(id, uint64_t, double, double);
  double v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  CLLocationCoordinate2D v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  const char *v30;
  uint8_t *v31;
  id v32;
  id v34;
  uint8_t buf[2];
  __int16 v36;

  v8 = a3;
  v9 = a4;
  v10 = (double (**)(id, uint64_t, double, double))a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v25 = 0;
      goto LABEL_13;
    }
    v36 = 0;
    v30 = "Invalid parameter not satisfying: startLocation";
    v31 = (uint8_t *)&v36;
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
    goto LABEL_10;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: endLocation";
    v31 = buf;
    goto LABEL_15;
  }
  objc_msgSend(v8, "coordinate");
  v12 = v11;
  objc_msgSend(v8, "coordinate");
  v14 = CLLocationCoordinate2DMake(v12, v13);
  objc_msgSend(v8, "timestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", 60.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v8;
  v17 = v8;
  v18 = 1;
  while (1)
  {
    v19 = v10[2](v10, v18, v14.latitude, v14.longitude);
    v21 = v20;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v16, v19, v20, 0.0, 10.0, 10.0, 0.0, 0.0);
    objc_msgSend(v22, "distanceFromLocation:", v17);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v16, v19, v21, 0.0, 10.0, 10.0, 0.0, v23 / 60.0);
    -[RTSignalGenerator addGeneratedLocation:forceInject:](self, "addGeneratedLocation:forceInject:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    ++self->_totalTransitionLocationsGeneratedCount;
    if (v25)
      break;

    ++v18;
    objc_msgSend(v16, "dateByAddingTimeInterval:", 60.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isBeforeDate:", v27);

    v16 = v26;
    v17 = v22;
    if ((v28 & 1) == 0)
      goto LABEL_12;
  }
  v32 = v25;

  v22 = v17;
  v26 = v16;
LABEL_12:

  v8 = v34;
LABEL_13:

  return v25;
}

- (id)locationsForVisit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
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
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  id v43;
  void *v46;
  void *v47;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "exit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7 / 100.0;

    if (v8 < 30.0)
      v8 = 30.0;
    objc_msgSend(v4, "entry");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v4, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "horizontalUncertainty");
      v11 = (double)arc4random_uniform((v10 * 0.5));
      v12 = v11 * 0.000009;

      if ((arc4random() & 1) == 0)
        v12 = -(v11 * 0.000009);
      v13 = objc_alloc(MEMORY[0x1E0D183B0]);
      objc_msgSend(v4, "location");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "latitude");
      v15 = v12 + v14;
      objc_msgSend(v4, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "longitude");
      v18 = v12 + v17;
      objc_msgSend(v4, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "horizontalUncertainty");
      v21 = v20;
      objc_msgSend(v4, "location");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "altitude");
      v24 = v23;
      objc_msgSend(v4, "location");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "verticalUncertainty");
      v27 = v26;
      objc_msgSend(v4, "location");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "referenceFrame");
      objc_msgSend(v4, "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "speed");
      v32 = v31;
      objc_msgSend(v4, "location");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v47, v29, objc_msgSend(v33, "sourceAccuracy"), v15, v18, v21, v24, v27, v32);

      objc_msgSend(v4, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "sourceAccuracy") == 2;

      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:speed:type:", v34, v36, 0.0);
      -[RTSignalGenerator addGeneratedLocation:forceInject:](self, "addGeneratedLocation:forceInject:", v37, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      ++self->_totalVisitLocationsGeneratedCount;
      if (v38)
        break;
      objc_msgSend(v47, "dateByAddingTimeInterval:", v8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "exit");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isOnOrBefore:", v40);

      v47 = v39;
      if ((v41 & 1) == 0)
        goto LABEL_14;
    }
    v43 = v38;

    v39 = v47;
LABEL_14:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    v38 = 0;
  }

  return v38;
}

+ (void)injectSignalForSignalGeneratorOptions:(id)a3 locationManager:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  RTSignalGenerator *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    v10 = -[RTSignalGenerator initWithSignalGeneratorOptions:locationManager:]([RTSignalGenerator alloc], "initWithSignalGeneratorOptions:locationManager:", v7, v8);
    -[RTSignalGenerator generateLocations](v10, "generateLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v13, 2u);
    }

  }
}

- (id)generateLocations
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  RTSignalGenerator *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  CLLocationDegrees v27;
  void *v28;
  CLLocationDegrees v29;
  CLLocationCoordinate2D v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  double v47;
  CLLocationDegrees v48;
  void *v49;
  CLLocationDegrees v50;
  CLLocationCoordinate2D v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  unint64_t totalVisitLocationsGeneratedCount;
  unint64_t totalTransitionLocationsGeneratedCount;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  RTSignalGenerator *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  unint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  -[RTSignalGeneratorOptions startLocation](self->_signalGeneratorOptions, "startLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
  v6 = (void *)objc_msgSend(v3, "initWithRTLocation:speed:", v4, v5 * 1.5);

  v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  -[RTSignalGeneratorOptions endLocation](self->_signalGeneratorOptions, "endLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
  v10 = (void *)objc_msgSend(v7, "initWithRTLocation:speed:", v8, v9 * 1.5);

  -[RTSignalGeneratorOptions expectedVisits](self->_signalGeneratorOptions, "expectedVisits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v87 = "-[RTSignalGenerator generateLocations]";
      v88 = 1024;
      LODWORD(v89) = 625;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: _signalGeneratorOptions.expectedVisits.count (in %s:%d)", buf, 0x12u);
    }

  }
  v14 = v6;
  -[RTSignalGenerator addGeneratedLocation:forceInject:](self, "addGeneratedLocation:forceInject:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_totalTransitionLocationsGeneratedCount;
  if (v15)
  {
    v16 = v15;
    v17 = v14;
  }
  else
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[RTSignalGeneratorOptions expectedVisits](self->_signalGeneratorOptions, "expectedVisits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (uint64_t)v14;
    v78 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v78)
    {
      v76 = v18;
      v77 = self;
      v20 = 0;
      v74 = v10;
      v75 = *(_QWORD *)v83;
      v73 = v14;
      v19 = (uint64_t)v14;
      v21 = self;
      while (2)
      {
        v22 = 0;
        v23 = v20;
        v81 = (void *)v19;
        do
        {
          if (*(_QWORD *)v83 != v75)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v22);
          v25 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v24, "location");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "latitude");
          v27 = v26;
          objc_msgSend(v24, "location");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "longitude");
          v30 = CLLocationCoordinate2DMake(v27, v29);
          objc_msgSend(v24, "location");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "altitude");
          v33 = v32;
          objc_msgSend(v24, "location");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "horizontalUncertainty");
          v36 = v35;
          objc_msgSend(v24, "location");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "verticalUncertainty");
          v39 = v38;
          objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
          v41 = v40 * 1.5;
          objc_msgSend(v24, "entry");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_msgSend(v25, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v42, v30.latitude, v30.longitude, v33, v36, v39, 0.0, v41);

          v80 = v43;
          -[RTSignalGenerator transitionLocationsBetweenStartLocation:endLocation:](v21, "transitionLocationsBetweenStartLocation:endLocation:", v81, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44
            || (-[RTSignalGenerator locationsForVisit:](v21, "locationsForVisit:", v24),
                (v44 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = v44;

            v14 = v73;
            v10 = v74;
            v17 = v81;
            goto LABEL_24;
          }
          v45 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v24, "location");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "latitude");
          v48 = v47;
          objc_msgSend(v24, "location");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "longitude");
          v51 = CLLocationCoordinate2DMake(v48, v50);
          objc_msgSend(v24, "location");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "altitude");
          v54 = v53;
          objc_msgSend(v24, "location");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "horizontalUncertainty");
          v57 = v56;
          objc_msgSend(v24, "location");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "verticalUncertainty");
          v60 = v59;
          objc_msgSend((id)objc_opt_class(), "minSpeedToFilterHyperParameter");
          v62 = v61 * 1.5;
          objc_msgSend(v24, "exit");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v45, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v63, v51.latitude, v51.longitude, v54, v57, v60, 0.0, v62);

          ++v22;
          v20 = v80;
          v23 = v80;
          v81 = (void *)v19;
          v18 = v76;
        }
        while (v78 != v22);
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v78)
          continue;
        break;
      }

      v14 = v73;
      v10 = v74;
      self = v77;
    }

    v64 = v10;
    v65 = (void *)v19;
    -[RTSignalGenerator transitionLocationsBetweenStartLocation:endLocation:](self, "transitionLocationsBetweenStartLocation:endLocation:", v19, v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      v67 = v66;
    }
    else
    {
      -[RTSignalGenerator addGeneratedLocation:forceInject:](self, "addGeneratedLocation:forceInject:", v64, 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      ++self->_totalTransitionLocationsGeneratedCount;
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        totalVisitLocationsGeneratedCount = self->_totalVisitLocationsGeneratedCount;
        totalTransitionLocationsGeneratedCount = self->_totalTransitionLocationsGeneratedCount;
        *(_DWORD *)buf = 134218240;
        v87 = (const char *)totalVisitLocationsGeneratedCount;
        v88 = 2048;
        v89 = totalTransitionLocationsGeneratedCount;
        _os_log_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_INFO, "RTSignalGenerator Produced %lu visit locations && %lu transition locations", buf, 0x16u);
      }

      v67 = v68;
    }
    v16 = v67;

    v17 = v65;
  }
LABEL_24:

  return v16;
}

- (NSMutableArray)generatedLocations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGeneratedLocations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedLocations, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_signalGeneratorOptions, 0);
}

@end
