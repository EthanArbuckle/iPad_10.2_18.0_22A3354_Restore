@implementation MOPlatformInfo

+ (id)extractHardwareAndSoftwareMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v2 = (void *)objc_opt_new();
  +[MOPlatformInfo getHWModel](MOPlatformInfo, "getHWModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOPlatformInfo getProductType](MOPlatformInfo, "getProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOPlatformInfo getBuildVersion](MOPlatformInfo, "getBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MOPlatformInfo getProductVersion](MOPlatformInfo, "getProductVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
  v8 = +[MOPlatformInfo isSeedBuild](MOPlatformInfo, "isSeedBuild");
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("kMOHardwareModel"));
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("kMOProductType"));
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("kMOBuildVersion"));
  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("kMOProductVersion"));
  if (v7)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("kMOIsInternalBuild"));
  if (v8)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("kMOIsSeedBuild"));
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

+ (id)getHWModel
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getHWModel].cold.1();

  }
  return v2;
}

+ (id)getProductType
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getProductType].cold.1();

  }
  return v2;
}

+ (id)getBuildVersion
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getBuildVersion].cold.1();

  }
  return v2;
}

+ (id)getProductVersion
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MGCopyAnswerWithError();
  if (!v2)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getProductVersion].cold.1();

  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  if (!os_variant_has_internal_diagnostics())
    return 0;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectForKey:", CFSTR("PlatformInfoOverrideIsInternalBuild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)isSeedBuild
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectForKey:", CFSTR("PlatformInfoOverrideIsSeedBuild"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)wasBuildVersionUpdated
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = (void *)objc_opt_new();
  +[MOPlatformInfo extractHardwareAndSoftwareMetadata](MOPlatformInfo, "extractHardwareAndSoftwareMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LastBuildVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("kMOBuildVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (void)persistBuildVersion
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  +[MOPlatformInfo extractHardwareAndSoftwareMetadata](MOPlatformInfo, "extractHardwareAndSoftwareMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kMOBuildVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("LastBuildVersion"));

}

+ (BOOL)isIpad
{
  if (isIpad_onceToken != -1)
    dispatch_once(&isIpad_onceToken, &__block_literal_global_2);
  return isIpad_result;
}

void __24__MOPlatformInfo_isIpad__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
  {
    v3 = v0;
    v2 = objc_msgSend(v0, "isEqualToString:", CFSTR("iPad"));
    v1 = v3;
    if (v2)
      isIpad_result = 1;
  }

}

+ (void)getHWModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_243AAA000, v0, v1, "Could not get hardware version string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)getProductType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_243AAA000, v0, v1, "Could not get product type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)getBuildVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_243AAA000, v0, v1, "Could not get build version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)getProductVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_243AAA000, v0, v1, "Could not get product version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
