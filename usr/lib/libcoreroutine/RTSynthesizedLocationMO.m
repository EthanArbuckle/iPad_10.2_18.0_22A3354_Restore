@implementation RTSynthesizedLocationMO

+ (id)managedObjectWithSynthesizedLocation:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  RTSynthesizedLocationMO *v8;
  double v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v8 = 0;
      goto LABEL_8;
    }
    v16 = 0;
    v12 = "Invalid parameter not satisfying: synthesizedLocation";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 0;
    v12 = "Invalid parameter not satisfying: managedObjectContext";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  v8 = -[RTSynthesizedLocationMO initWithContext:]([RTSynthesizedLocationMO alloc], "initWithContext:", v6);
  objc_msgSend(v5, "coordinate");
  -[RTSynthesizedLocationMO setLatitude:](v8, "setLatitude:");
  objc_msgSend(v5, "coordinate");
  -[RTSynthesizedLocationMO setLongitude:](v8, "setLongitude:", v9);
  objc_msgSend(v5, "altitude");
  -[RTSynthesizedLocationMO setAltitude:](v8, "setAltitude:");
  objc_msgSend(v5, "horizontalAccuracy");
  -[RTSynthesizedLocationMO setHorizontalAccuracy:](v8, "setHorizontalAccuracy:");
  objc_msgSend(v5, "verticalAccuracy");
  -[RTSynthesizedLocationMO setVerticalAccuracy:](v8, "setVerticalAccuracy:");
  objc_msgSend(v5, "speed");
  -[RTSynthesizedLocationMO setSpeed:](v8, "setSpeed:");
  objc_msgSend(v5, "course");
  -[RTSynthesizedLocationMO setCourse:](v8, "setCourse:");
  objc_msgSend(v5, "speedAccuracy");
  -[RTSynthesizedLocationMO setSpeedAccuracy:](v8, "setSpeedAccuracy:");
  objc_msgSend(v5, "courseAccuracy");
  -[RTSynthesizedLocationMO setCourseAccuracy:](v8, "setCourseAccuracy:");
  objc_msgSend(v5, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSynthesizedLocationMO setTimestamp:](v8, "setTimestamp:", v10);

  -[RTSynthesizedLocationMO setDownsamplingLevel:](v8, "setDownsamplingLevel:", (__int16)objc_msgSend(v5, "downsamplingLevel"));
  -[RTSynthesizedLocationMO setGeoRoadClass:](v8, "setGeoRoadClass:", (__int16)objc_msgSend(v5, "geoRoadClass"));
  -[RTSynthesizedLocationMO setGeoFormOfWay:](v8, "setGeoFormOfWay:", (__int16)objc_msgSend(v5, "geoFormOfWay"));
  -[RTSynthesizedLocationMO setLocationType:](v8, "setLocationType:", (__int16)objc_msgSend(v5, "locationType"));
LABEL_8:

  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTSynthesizedLocationMO"));
}

@end
