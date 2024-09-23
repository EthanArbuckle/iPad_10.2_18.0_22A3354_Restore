@implementation RTLocation(RTExtensions)

- (id)initWithCLLocation:()RTExtensions
{
  id v4;
  uint64_t v5;
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
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;

  if (a3)
  {
    v4 = a3;
    if (objc_msgSend(v4, "type") == 1)
      v5 = 2;
    else
      v5 = 1;
    objc_msgSend(v4, "coordinate");
    v7 = v6;
    objc_msgSend(v4, "coordinate");
    v9 = v8;
    objc_msgSend(v4, "horizontalAccuracy");
    v11 = v10;
    objc_msgSend(v4, "altitude");
    v13 = v12;
    objc_msgSend(v4, "verticalAccuracy");
    v15 = v14;
    objc_msgSend(v4, "timestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v4, "referenceFrame");
    objc_msgSend(v4, "speed");
    v19 = v18;

    a1 = (id)objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:sourceAccuracy:", v16, v17, v5, v7, v9, v11, v13, v15, v19);
    v20 = a1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)distanceFromLocation:()RTExtensions locationShifter:handler:
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
    {
      v12 = objc_msgSend(a1, "referenceFrame") != 2;
      if (((v12 ^ (objc_msgSend(v9, "referenceFrame") == 2)) & 1) != 0)
      {
        objc_msgSend(a1, "latitude");
        objc_msgSend(a1, "longitude");
        objc_msgSend(v9, "latitude");
        objc_msgSend(v9, "longitude");
        RTCommonCalculateDistanceHighPrecision();
        v11[2](v11, 0);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v19 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v32 = v19;
          v33 = 1024;
          v34 = objc_msgSend(a1, "referenceFrame");
          v35 = 1024;
          v36 = objc_msgSend(v9, "referenceFrame");
          _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, reference frames don't match, self.referenceFrame, %d, location.referenceFrame, %d", buf, 0x18u);

        }
        if (v10)
        {
          if (objc_msgSend(a1, "referenceFrame") == 2)
          {
            v20 = a1;
            v21 = a1;
            v22 = v9;
          }
          else
          {
            v20 = a1;
            v21 = v9;
            v22 = a1;
          }
          objc_msgSend(v20, "_distanceBetweenShiftedLocation:unshiftedLocation:locationShifter:handler:", v21, v22, v10, v11);
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = *MEMORY[0x1E0D18598];
          v29 = *MEMORY[0x1E0CB2D50];
          v30 = CFSTR("Reference frames do not match and we do not have a location shifter.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 6, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (*)(void (**)(id, _QWORD), void *, double))v11[2])(v11, v26, INFINITY);

          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v28 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v28;
            _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, Unable to shift, no location shifter", buf, 0xCu);

          }
        }
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v37 = *MEMORY[0x1E0CB2D50];
      v38[0] = CFSTR("Location is required.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(id, _QWORD), void *, double))v11[2])(v11, v17, INFINITY);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[RTLocation(RTExtensions) distanceFromLocation:locationShifter:handler:]";
      v33 = 1024;
      v34 = 173;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

- (double)distanceFromLocation:()RTExtensions locationShifter:error:
{
  id v9;
  id v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  double v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v50 = *MEMORY[0x1E0CB2D50];
      v51[0] = CFSTR("Location is required.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_16;
  }
  v11 = objc_msgSend(a1, "referenceFrame") != 2;
  if (((v11 ^ (objc_msgSend(v9, "referenceFrame") == 2)) & 1) != 0)
  {
    objc_msgSend(a1, "latitude");
    objc_msgSend(a1, "longitude");
    objc_msgSend(v9, "latitude");
    objc_msgSend(v9, "longitude");
    RTCommonCalculateDistanceHighPrecision();
    v13 = v12;
    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v35;
    v46 = 1024;
    v47 = objc_msgSend(a1, "referenceFrame");
    v48 = 1024;
    v49 = objc_msgSend(v9, "referenceFrame");
    _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@, reference frames don't match, self.referenceFrame, %d, location.referenceFrame, %d", buf, 0x18u);

  }
  if (!v10)
  {
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0D18598];
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = CFSTR("Reference frames do not match and we do not have a location shifter.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 6, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v37;
      _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "%@, Unable to shift, no location shifter", buf, 0xCu);

    }
LABEL_16:
    v13 = INFINITY;
    goto LABEL_26;
  }
  v18 = a1;
  v19 = v9;
  if (objc_msgSend(v18, "referenceFrame") == 2)
  {
    v38 = 0;
    objc_msgSend(v10, "shiftedLocation:allowNetwork:error:", v19, 0, &v38);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v22 = v38;
    v19 = (id)v20;
  }
  else
  {
    v39 = 0;
    objc_msgSend(v10, "shiftedLocation:allowNetwork:error:", v18, 0, &v39);
    v27 = objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v22 = v39;
    v18 = (id)v27;
  }
  v28 = v22;

  if (v28)
  {
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0D18598];
      v40 = *MEMORY[0x1E0CB2D50];
      v41 = CFSTR("Reference frames do not match and we encounted an error when trying to shift.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 6, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v36;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, Unable to shift, location shifter error", buf, 0xCu);

    }
    v13 = INFINITY;
  }
  else
  {
    objc_msgSend(v18, "latitude");
    objc_msgSend(v18, "longitude");
    objc_msgSend(v19, "latitude");
    objc_msgSend(v19, "longitude");
    RTCommonCalculateDistanceHighPrecision();
    v13 = v33;
  }

LABEL_26:
  return v13;
}

+ (uint64_t)convertLocationReferenceFrame:()RTExtensions
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (uint64_t)initWithRTPLocation:()RTExtensions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "latitude");
  v6 = v5;
  objc_msgSend(v4, "longitude");
  v8 = v7;
  objc_msgSend(v4, "uncertainty");
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(MEMORY[0x1E0D183B0], "convertLocationReferenceFrame:", objc_msgSend(v4, "referenceFrame"));
  objc_msgSend(v4, "speed");
  v15 = v14;

  v16 = objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", v12, v13, v6, v8, v10, -1.0, -1.0, v15);
  return v16;
}

- (id)initWithRTPair:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "secondObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v10 = v9;
      objc_msgSend(v5, "secondObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id)objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:date:", v14, v10, v13, 0.0);

      v15 = a1;
LABEL_7:

      goto LABEL_8;
    }
  }
  v15 = 0;
LABEL_8:

  return v15;
}

- (id)initWithCLLocationCoordinate2D:()RTExtensions
{
  double v4;
  double v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *a3;
    v5 = a3[1];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:date:", v6, v4, v5, 0.0);

    v7 = a1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)initWithCLCircularRegion:()RTExtensions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  __int16 v14[8];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "geoCenter");
    v7 = v6;
    objc_msgSend(v5, "geoCenter");
    v9 = v8;
    objc_msgSend(v5, "geoRadius");
    a1 = (id)objc_msgSend(a1, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, objc_msgSend(v5, "geoReferenceFrame"), v7, v9, v10);
    v11 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region", (uint8_t *)v14, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)_distanceBetweenShiftedLocation:()RTExtensions unshiftedLocation:locationShifter:handler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  CLLocationDegrees v15;
  CLLocationDegrees v16;
  CLLocationCoordinate2D v17;
  double v18;
  double v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v13, "latitude");
  v15 = v14;
  objc_msgSend(v13, "longitude");
  v17 = CLLocationCoordinate2DMake(v15, v16);
  objc_msgSend(v13, "horizontalUncertainty");
  v19 = v18;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __102__RTLocation_RTExtensions___distanceBetweenShiftedLocation_unshiftedLocation_locationShifter_handler___block_invoke;
  v22[3] = &unk_1E929F280;
  v24 = v11;
  v25 = a2;
  v23 = v10;
  v20 = v10;
  v21 = v11;
  objc_msgSend(v12, "shiftCoordinate:accuracy:handler:", v22, v17.latitude, v17.longitude, v19);

}

- (id)locationAtDistance:()RTExtensions course:
{
  void *v6;
  id v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(a1, "latitude");
  v9 = v8;
  objc_msgSend(a1, "longitude");
  v11 = CLLocationCoordinate2DMake(v9, v10);
  objc_msgSend(a1, "horizontalUncertainty");
  v13 = (void *)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v6, v11.latitude, v11.longitude, 0.0, v12, -1.0, a3, a2);
  objc_msgSend(v13, "propagateLocationToTime:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v14, "coordinate");
  v17 = v16;
  objc_msgSend(v14, "coordinate");
  v19 = v18;
  objc_msgSend(a1, "horizontalUncertainty");
  v21 = v20;
  objc_msgSend(a1, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v22, objc_msgSend(a1, "referenceFrame"), v17, v19, v21);

  return v23;
}

@end
