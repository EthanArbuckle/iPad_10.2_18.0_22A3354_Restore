@implementation RTBackgroundInertialOdometrySampleMO

+ (id)managedObjectWithCLBackgroundInertialOdometrySample:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTBackgroundInertialOdometrySampleMO *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v24;
  __int16 v25;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v25 = 0;
    v21 = "Invalid parameter not satisfying: ioSample";
    v22 = (uint8_t *)&v25;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v24 = 0;
    v21 = "Invalid parameter not satisfying: managedObjectContext";
    v22 = (uint8_t *)&v24;
    goto LABEL_10;
  }
  v8 = -[RTBackgroundInertialOdometrySampleMO initWithContext:]([RTBackgroundInertialOdometrySampleMO alloc], "initWithContext:", v6);
  objc_msgSend(v5, "cfAbsTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTBackgroundInertialOdometrySampleMO setCfAbsTimestamp:](v8, "setCfAbsTimestamp:", v9);

  objc_msgSend(v5, "machContinuousTimestamp_s");
  -[RTBackgroundInertialOdometrySampleMO setMachContinuousTimestamp_s:](v8, "setMachContinuousTimestamp_s:");
  objc_msgSend(v5, "sampleInterval_s");
  -[RTBackgroundInertialOdometrySampleMO setSampleInterval_s:](v8, "setSampleInterval_s:");
  objc_msgSend(v5, "deltaPosition_m");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "X");
  -[RTBackgroundInertialOdometrySampleMO setDeltaPositionX_m:](v8, "setDeltaPositionX_m:");

  objc_msgSend(v5, "deltaPosition_m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Y");
  -[RTBackgroundInertialOdometrySampleMO setDeltaPositionY_m:](v8, "setDeltaPositionY_m:");

  objc_msgSend(v5, "deltaPosition_m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Z");
  -[RTBackgroundInertialOdometrySampleMO setDeltaPositionZ_m:](v8, "setDeltaPositionZ_m:");

  objc_msgSend(v5, "deltaVelocity_mps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "X");
  -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityX_mps:](v8, "setDeltaVelocityX_mps:");

  objc_msgSend(v5, "deltaVelocity_mps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Y");
  -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityY_mps:](v8, "setDeltaVelocityY_mps:");

  objc_msgSend(v5, "deltaVelocity_mps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Z");
  -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityZ_mps:](v8, "setDeltaVelocityZ_mps:");

  objc_msgSend(v5, "quaternion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "X");
  -[RTBackgroundInertialOdometrySampleMO setQuaternionX:](v8, "setQuaternionX:");

  objc_msgSend(v5, "quaternion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "Y");
  -[RTBackgroundInertialOdometrySampleMO setQuaternionY:](v8, "setQuaternionY:");

  objc_msgSend(v5, "quaternion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "Z");
  -[RTBackgroundInertialOdometrySampleMO setQuaternionZ:](v8, "setQuaternionZ:");

  objc_msgSend(v5, "quaternion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "W");
  -[RTBackgroundInertialOdometrySampleMO setQuaternionW:](v8, "setQuaternionW:");

LABEL_8:
  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTBackgroundInertialOdometrySampleMO"));
}

@end
