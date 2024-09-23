@implementation RTTripSegmentInertialDataMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTTripSegmentInertialDataMO"));
}

+ (id)managedObjectWithTripSegmentInertialData:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTTripSegmentInertialDataMO *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v14;
  __int16 v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v15 = 0;
    v11 = "Invalid parameter not satisfying: inertialData";
    v12 = (uint8_t *)&v15;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = 0;
    v11 = "Invalid parameter not satisfying: managedObjectContext";
    v12 = (uint8_t *)&v14;
    goto LABEL_10;
  }
  v8 = -[RTTripSegmentInertialDataMO initWithContext:]([RTTripSegmentInertialDataMO alloc], "initWithContext:", v6);
  objc_msgSend(v5, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTripSegmentInertialDataMO setTimestamp:](v8, "setTimestamp:", v9);

  objc_msgSend(v5, "dataPeriod_s");
  -[RTTripSegmentInertialDataMO setDataPeriodSec:](v8, "setDataPeriodSec:");
  objc_msgSend(v5, "deltaCourse_rad");
  -[RTTripSegmentInertialDataMO setDeltaCourseRad:](v8, "setDeltaCourseRad:");
  objc_msgSend(v5, "deltaSpeed_mps");
  -[RTTripSegmentInertialDataMO setDeltaSpeedMps:](v8, "setDeltaSpeedMps:");
  objc_msgSend(v5, "deltaCourseVar_rad2");
  -[RTTripSegmentInertialDataMO setDeltaCourseVarRad2:](v8, "setDeltaCourseVarRad2:");
  objc_msgSend(v5, "deltaSpeedVar_mps2");
  -[RTTripSegmentInertialDataMO setDeltaSpeedVarMps2:](v8, "setDeltaSpeedVarMps2:");
  objc_msgSend(v5, "deltaCourseSpeedCovar_radmps");
  -[RTTripSegmentInertialDataMO setDeltaCourseSpeedCovRadMps:](v8, "setDeltaCourseSpeedCovRadMps:");
LABEL_8:

  return v8;
}

@end
