@implementation CLLocation(RTExtensions)

- (uint64_t)coordinateToString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "coordinate");
  v4 = v3;
  objc_msgSend(a1, "coordinate");
  return objc_msgSend(v2, "stringWithFormat:", CFSTR("<%+.8f,%+.8f>"), v4, v5);
}

- (id)toString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "coordinate");
  v24 = v3;
  objc_msgSend(a1, "coordinate");
  v5 = v4;
  objc_msgSend(a1, "horizontalAccuracy");
  v7 = v6;
  objc_msgSend(a1, "altitude");
  v9 = v8;
  objc_msgSend(a1, "verticalAccuracy");
  v11 = v10;
  objc_msgSend(a1, "speed");
  v13 = v12;
  objc_msgSend(a1, "speedAccuracy");
  v15 = v14;
  objc_msgSend(a1, "course");
  v17 = v16;
  objc_msgSend(a1, "courseAccuracy");
  v19 = v18;
  objc_msgSend(a1, "timestamp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringFromDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%+.8f,%+.8f> +/- %.2fm alt %.2f +/- %.2fm, speed %.2f +/- %.2fmps, course %.2f +/- %.2fdeg, @ %@, type, %u"), v24, v5, v7, v9, v11, v13, v15, v17, v19, v21, objc_msgSend(a1, "type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)initWithRTLocation:()RTExtensions
{
  id v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  CLLocationDegrees v8;
  CLLocationCoordinate2D v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int16 v16[8];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "latitude");
    v7 = v6;
    objc_msgSend(v5, "longitude");
    v9 = CLLocationCoordinate2DMake(v7, v8);
    objc_msgSend(v5, "horizontalUncertainty");
    v11 = v10;
    objc_msgSend(v5, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v9.latitude, v9.longitude, 0.0, v11, -1.0);

    v13 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)v16, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)initWithRTLocation:()RTExtensions speed:
{
  id v6;
  void *v7;
  double v8;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int16 v18[8];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "latitude");
    v9 = v8;
    objc_msgSend(v7, "longitude");
    v11 = CLLocationCoordinate2DMake(v9, v10);
    objc_msgSend(v7, "horizontalUncertainty");
    v13 = v12;
    objc_msgSend(v7, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v14, v11.latitude, v11.longitude, 0.0, v13, -1.0, 0.0, a2);

    v15 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (uint64_t)initWithRTLocation:()RTExtensions speed:type:
{
  return objc_msgSend(a1, "initWithRTLocation:speed:type:signalEnvironmentType:", a3, a4, 0);
}

- (uint64_t)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:
{
  return objc_msgSend(a1, "initWithRTLocation:speed:type:signalEnvironmentType:integrity:", a3, a4, a5, *MEMORY[0x1E0C9E518]);
}

- (id)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:integrity:
{
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  _OWORD v19[8];
  _OWORD v20[2];
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];

  v12 = a4;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: location";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_13;
  }
  if (a5 >= 0xE)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: type >= kCLLocationType_Unknown && type < kCLLocationType_Max";
    goto LABEL_12;
  }
  if (a6 >= 7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Invalid parameter not satisfying: signalEnvironmentType >= kCLClientSignalEnvUnavailable && signalEnvironmen"
            "tType <= kCLClientSignalEnvFoliage";
      goto LABEL_12;
    }
LABEL_13:

    v17 = 0;
    goto LABEL_14;
  }
  v28 = 0u;
  memset(v29, 0, 28);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)buf = 0u;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:speed:", v12, a2);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "clientLocation");
  }
  else
  {
    v28 = 0u;
    memset(v29, 0, 28);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    *(_OWORD *)buf = 0u;
  }

  HIDWORD(v29[0]) = a6;
  LODWORD(v27) = a5;
  LODWORD(v29[0]) = a7;
  v19[6] = v27;
  v19[7] = v28;
  v20[0] = v29[0];
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)v29 + 12);
  v19[2] = v23;
  v19[3] = v24;
  v19[4] = v25;
  v19[5] = v26;
  v19[0] = *(_OWORD *)buf;
  v19[1] = v22;
  a1 = (id)objc_msgSend(a1, "initWithClientLocation:", v19);
  v17 = a1;
LABEL_14:

  return v17;
}

- (id)initWithRTLocationOfInterest:()RTExtensions
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  NSObject *v23;
  __int16 v25[8];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v11 = CLLocationCoordinate2DMake(v8, v10);
    objc_msgSend(v5, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "altitude");
    v14 = v13;
    objc_msgSend(v5, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "horizontalUncertainty");
    v17 = v16;
    objc_msgSend(v5, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "verticalUncertainty");
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v21, v11.latitude, v11.longitude, v14, v17, v20);

    v22 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loi", (uint8_t *)v25, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (uint64_t)initWithRTPLocation:()RTExtensions
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v18[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v4, "latitude");
    v7 = v6;
    objc_msgSend(v4, "longitude");
    v9 = v8;
    objc_msgSend(v4, "uncertainty");
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:horizontalUncertainty:date:", v13, v7, v9, v11);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:", v14);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (id)initWithRTCLLocationMO:()RTExtensions
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
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
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v37;
  _OWORD v38[8];
  _OWORD v39[2];
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "courseAccuracy");
    v6 = -1.0;
    v8 = v7 == 0.0;
    v9 = -1.0;
    if (!v8)
      objc_msgSend(v5, "courseAccuracy", -1.0);
    v37 = v9;
    objc_msgSend(v5, "speedAccuracy");
    if (v10 != 0.0)
    {
      objc_msgSend(v5, "speedAccuracy");
      v6 = v11;
    }
    v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v5, "latitude");
    v14 = v13;
    objc_msgSend(v5, "longitude");
    v16 = CLLocationCoordinate2DMake(v14, v15);
    objc_msgSend(v5, "altitude");
    v18 = v17;
    objc_msgSend(v5, "horizontalAccuracy");
    v20 = v19;
    objc_msgSend(v5, "verticalAccuracy");
    v22 = v21;
    objc_msgSend(v5, "course");
    v24 = v23;
    objc_msgSend(v5, "speed");
    v26 = v25;
    objc_msgSend(v5, "timestamp");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v12, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:", v27, v16.latitude, v16.longitude, v18, v20, v22, v24, v37, v26, *(_QWORD *)&v6);

    v47 = 0u;
    memset(v48, 0, 28);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    *(_OWORD *)buf = 0u;
    if (v28)
      -[NSObject clientLocation](v28, "clientLocation");
    objc_msgSend(v5, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v5, "type");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46) = objc_msgSend(v30, "unsignedIntValue");

    }
    else
    {
      LODWORD(v46) = 0;
    }

    objc_msgSend(v5, "signalEnvironmentType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v5, "signalEnvironmentType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v48[0]) = objc_msgSend(v33, "unsignedIntValue");

    }
    else
    {
      HIDWORD(v48[0]) = 0;
    }

    objc_msgSend(v5, "integrity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v5, "integrity");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48[0]) = objc_msgSend(v35, "unsignedIntValue");

    }
    else
    {
      LODWORD(v48[0]) = *MEMORY[0x1E0C9E518];
    }

    v38[6] = v46;
    v38[7] = v47;
    v39[0] = v48[0];
    *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)((char *)v48 + 12);
    v38[2] = v42;
    v38[3] = v43;
    v38[4] = v44;
    v38[5] = v45;
    v38[0] = *(_OWORD *)buf;
    v38[1] = v41;
    a1 = (id)objc_msgSend(a1, "initWithClientLocation:", v38);
    v31 = a1;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationMO", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (uint64_t)initWithSMLocation:()RTExtensions
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v4 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "latitude");
  v8 = v7;
  objc_msgSend(v5, "longitude");
  v10 = CLLocationCoordinate2DMake(v8, v9);
  objc_msgSend(v5, "altitude");
  v12 = v11;
  objc_msgSend(v5, "hunc");
  v14 = v13;
  objc_msgSend(v5, "vunc");
  v16 = v15;
  objc_msgSend(v5, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v10.latitude, v10.longitude, v12, v14, v16);
  return v18;
}

- (uint64_t)initWithSMInitiatorLocation:()RTExtensions
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v4 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "latitude");
  v8 = v7;
  objc_msgSend(v5, "longitude");
  v10 = CLLocationCoordinate2DMake(v8, v9);
  objc_msgSend(v5, "altitude");
  v12 = v11;
  objc_msgSend(v5, "hunc");
  v14 = v13;
  objc_msgSend(v5, "vunc");
  v16 = v15;
  objc_msgSend(v5, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v6, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v10.latitude, v10.longitude, v12, v14, v16);
  return v18;
}

- (id)toVerboseString
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;

  objc_msgSend(a1, "sourceInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "sourceInformation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSimulatedBySoftware");

  }
  else
  {
    v4 = -1;
  }

  objc_msgSend(a1, "sourceInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "sourceInformation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isProducedByAccessory");

  }
  else
  {
    v7 = -1;
  }

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "coordinate");
  v35 = v9;
  objc_msgSend(a1, "coordinate");
  v34 = v10;
  objc_msgSend(a1, "altitude");
  v12 = v11;
  objc_msgSend(a1, "horizontalAccuracy");
  v14 = v13;
  objc_msgSend(a1, "verticalAccuracy");
  v16 = v15;
  objc_msgSend(a1, "speed");
  v18 = v17;
  objc_msgSend(a1, "speedAccuracy");
  v20 = v19;
  objc_msgSend(a1, "course");
  v22 = v21;
  objc_msgSend(a1, "courseAccuracy");
  v24 = v23;
  v25 = objc_msgSend(a1, "type");
  v26 = objc_msgSend(a1, "integrity");
  objc_msgSend(a1, "timestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceReferenceDate");
  v29 = v28;
  objc_msgSend(a1, "timestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringFromDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("lat, % 12.9f, lon, % 12.9f, alt, % 9.3f, hacc, % 9.3f, vacc, % 9.3f, speed, % 9.3f, sacc, % 9.3f, course, % 9.3f, cacc, % 9.3f, type, %3d, integrity, %3d, simulated, %+3ld, accessory, %+3ld, timestamp, %.3f, date, %@"), v35, v34, v12, v14, v16, v18, v20, v22, v24, v25, v26, v4, v7, v29, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

@end
