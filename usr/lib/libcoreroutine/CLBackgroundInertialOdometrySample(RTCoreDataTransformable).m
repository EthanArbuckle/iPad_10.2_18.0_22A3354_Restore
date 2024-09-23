@implementation CLBackgroundInertialOdometrySample(RTCoreDataTransformable)

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
      v15 = "+[CLBackgroundInertialOdometrySample(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 36;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by CLBackgroundInertialOdometrySample+CoreDataTransformable (in %s:%d)", (uint8_t *)&v10, 0x26u);

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
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;

  v3 = (objc_class *)MEMORY[0x1E0C9E358];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "cfAbsTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "machContinuousTimestamp_s");
  v8 = v7;
  objc_msgSend(v4, "sampleInterval_s");
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0C9E340]);
  objc_msgSend(v4, "deltaPositionX_m");
  v13 = v12;
  objc_msgSend(v4, "deltaPositionY_m");
  v15 = v14;
  objc_msgSend(v4, "deltaPositionZ_m");
  v17 = (void *)objc_msgSend(v11, "initWithX:Y:Z:", v13, v15, v16);
  v18 = objc_alloc(MEMORY[0x1E0C9E348]);
  objc_msgSend(v4, "deltaVelocityX_mps");
  v20 = v19;
  objc_msgSend(v4, "deltaVelocityY_mps");
  v22 = v21;
  objc_msgSend(v4, "deltaVelocityZ_mps");
  v24 = (void *)objc_msgSend(v18, "initWithX:Y:Z:", v20, v22, v23);
  v25 = objc_alloc(MEMORY[0x1E0C9E350]);
  objc_msgSend(v4, "quaternionX");
  v27 = v26;
  objc_msgSend(v4, "quaternionY");
  v29 = v28;
  objc_msgSend(v4, "quaternionZ");
  v31 = v30;
  objc_msgSend(v4, "quaternionW");
  v33 = v32;

  v34 = (void *)objc_msgSend(v25, "initWithX:Y:Z:W:", v27, v29, v31, v33);
  v35 = (void *)objc_msgSend(v5, "initWithTimestamp:machContinuousTimestamp:sampleInterval:deltaPosition:deltaVelocity:quaternion:", v6, v17, v24, v34, v8, v10);

  return v35;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTBackgroundInertialOdometrySampleMO managedObjectWithCLBackgroundInertialOdometrySample:inManagedObjectContext:](RTBackgroundInertialOdometrySampleMO, "managedObjectWithCLBackgroundInertialOdometrySample:inManagedObjectContext:", a1, a3);
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
