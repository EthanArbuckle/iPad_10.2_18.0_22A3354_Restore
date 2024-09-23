@implementation CLLocation(RTCoreDataTransformable)

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  id v4;
  double v5;
  double v6;
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
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  double v29;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "coordinate");
    v29 = v5;
    objc_msgSend(a1, "coordinate");
    v7 = v6;
    objc_msgSend(a1, "altitude");
    v9 = v8;
    objc_msgSend(a1, "horizontalAccuracy");
    v11 = v10;
    objc_msgSend(a1, "verticalAccuracy");
    v13 = v12;
    objc_msgSend(a1, "course");
    v15 = v14;
    objc_msgSend(a1, "courseAccuracy");
    v17 = v16;
    objc_msgSend(a1, "speed");
    v19 = v18;
    objc_msgSend(a1, "speedAccuracy");
    v21 = v20;
    objc_msgSend(a1, "timestamp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "type"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "signalEnvironmentType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "integrity"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTCLLocationMO managedObjectWithLatitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:type:signalEnvironmentType:integrity:inManagedObjectContext:](RTCLLocationMO, "managedObjectWithLatitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:type:signalEnvironmentType:integrity:inManagedObjectContext:", v22, v23, v24, v25, v4, v29, v7, v9, v11, v13, v15, v17, v19, v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v4 = 0;
      goto LABEL_8;
    }
    LOWORD(v10) = 0;
    v6 = "Invalid parameter not satisfying: managedObject";
    v7 = v5;
    v8 = 2;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = 138412802;
    v11 = v3;
    v12 = 2080;
    v13 = "+[CLLocation(RTCoreDataTransformable) createWithManagedObject:]";
    v14 = 1024;
    v15 = 31;
    v6 = "managedObject, %@, is not supported by CLLocation+CoreDataTransformable (in %s:%d)";
    v7 = v5;
    v8 = 28;
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "createWithRTCLLocationMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithRTCLLocationMO:()RTCoreDataTransformable
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTCLLocationMO:", v3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtCLLocationMO", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

@end
