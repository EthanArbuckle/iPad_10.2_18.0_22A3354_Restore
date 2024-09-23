@implementation CLPLocation(RTExtensions)

- (void)initWithRTLocation:()RTExtensions rtMotionActivity:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "latitude");
    objc_msgSend(v8, "setLatitude:");
    objc_msgSend(v6, "longitude");
    objc_msgSend(v8, "setLongitude:");
    objc_msgSend(v6, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "setTimestamp:");

    objc_msgSend(v6, "horizontalUncertainty");
    *(float *)&v10 = v10;
    objc_msgSend(v8, "setHorizontalAccuracy:", v10);
    if (v7)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16B30]), "initWithRTMotionActivity:", v7);
      objc_msgSend(v8, "setMotionActivity:", v11);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[CLPLocation(RTExtensions) initWithRTLocation:rtMotionActivity:]";
      v16 = 1024;
      v17 = 209;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtLocation (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

    v8 = 0;
  }

  return v8;
}

@end
