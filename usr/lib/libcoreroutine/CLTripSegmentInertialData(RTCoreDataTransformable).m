@implementation CLTripSegmentInertialData(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = v9;
      v12 = 2112;
      v14 = 2080;
      v13 = v4;
      v15 = "+[CLTripSegmentInertialData(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 35;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTTripSegmentInertialData+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithTripSegmentInertialDataMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithTripSegmentInertialDataMO:()RTCoreDataTransformable
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v3 = (objc_class *)MEMORY[0x1E0C9E420];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataPeriodSec");
  v8 = v7;
  objc_msgSend(v4, "deltaCourseRad");
  v10 = v9;
  objc_msgSend(v4, "deltaSpeedMps");
  v12 = v11;
  objc_msgSend(v4, "deltaCourseVarRad2");
  v14 = v13;
  objc_msgSend(v4, "deltaSpeedVarMps2");
  v16 = v15;
  objc_msgSend(v4, "deltaCourseSpeedCovRadMps");
  v18 = v17;

  v19 = (void *)objc_msgSend(v5, "initWithTime:dataPeriodSec:deltaCourseRad:deltaSpeedMps:deltaCourseVarRad2:deltaSpeedVarMps2:deltaCourseSpeedCovarRadMps:", v6, v8, v10, v12, v14, v16, v18);
  return v19;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTTripSegmentInertialDataMO managedObjectWithTripSegmentInertialData:inManagedObjectContext:](RTTripSegmentInertialDataMO, "managedObjectWithTripSegmentInertialData:inManagedObjectContext:", a1, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

@end
