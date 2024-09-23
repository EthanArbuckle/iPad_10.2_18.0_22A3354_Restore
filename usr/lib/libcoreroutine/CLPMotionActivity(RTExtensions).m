@implementation CLPMotionActivity(RTExtensions)

+ (uint64_t)convertRTMotionActivtyType:()RTExtensions
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return dword_1D1EED1C4[a3 - 1];
}

+ (uint64_t)convertRTMotionActivtyConfidence:()RTExtensions
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

- (void)initWithRTMotionActivity:()RTExtensions
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setType:", objc_msgSend((id)objc_opt_class(), "convertRTMotionActivtyType:", objc_msgSend(v4, "type")));
    objc_msgSend(v5, "setConfidence:", objc_msgSend((id)objc_opt_class(), "convertRTMotionActivtyConfidence:", objc_msgSend(v4, "confidence")));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CLPMotionActivity(RTExtensions) initWithRTMotionActivity:]";
      v10 = 1024;
      v11 = 191;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtMotionActivity (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

@end
