@implementation SPSecureLocationsGreenTeaLogger

+ (void)sentSecureLocation
{
  uint64_t v2;
  uint64_t CTGreenTeaOsLogHandle;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = ct_green_tea_logger_create_static("searchpartyd", a2);
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle(v2);
  v4 = objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Transmitting Encrypted Location.", v6, 2u);
  }

}

@end
