@implementation STYDeviceInfo

+ (unint64_t)bootVolumeType
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__STYDeviceInfo_bootVolumeType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bootVolumeType_onceToken != -1)
    dispatch_once(&bootVolumeType_onceToken, block);
  return bootVolumeType_bootVolumeType;
}

uint64_t __31__STYDeviceInfo_bootVolumeType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_determineBootVolumeType");
  bootVolumeType_bootVolumeType = result;
  return result;
}

+ (unint64_t)_determineBootVolumeType
{
  return 2;
}

+ (NSString)hardwareModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__STYDeviceInfo_hardwareModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hardwareModel_onceToken != -1)
    dispatch_once(&hardwareModel_onceToken, block);
  return (NSString *)(id)hardwareModel_model;
}

void __30__STYDeviceInfo_hardwareModel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_determineHardwareModel");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hardwareModel_model;
  hardwareModel_model = v1;

}

+ (NSString)osBuild
{
  if (osBuild_onceToken != -1)
    dispatch_once(&osBuild_onceToken, &__block_literal_global_1);
  return (NSString *)(id)osBuild_osBuild;
}

void __24__STYDeviceInfo_osBuild__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)osBuild_osBuild;
  osBuild_osBuild = v0;

}

+ (id)_determineHardwareModel
{
  void *v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  if (!size)
    return CFSTR("model_name_unavailable");
  v2 = malloc_type_malloc(size, 0x100004077774924uLL);
  sysctlbyname("hw.model", v2, &size, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(v2);
  return v3;
}

+ (BOOL)isMemoryConstrained
{
  if (isMemoryConstrained_onceToken != -1)
    dispatch_once(&isMemoryConstrained_onceToken, &__block_literal_global_3);
  return isMemoryConstrained_isMemoryConstrained;
}

void __36__STYDeviceInfo_isMemoryConstrained__block_invoke()
{
  int v0;
  int v1;
  int v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  size_t v10;
  unint64_t v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 8;
  v11 = 0;
  v0 = sysctlbyname("hw.memsize", &v11, &v10, 0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = *__error();
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36__STYDeviceInfo_isMemoryConstrained__block_invoke_cold_1(v2, v1, v4);

    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "Going ahead with default threshold", buf, 2u);
    }

LABEL_10:
    isMemoryConstrained_isMemoryConstrained = 1;
    return;
  }
  v7 = v11;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v7 >> 20;
    _os_log_impl(&dword_1CB87B000, v9, OS_LOG_TYPE_DEFAULT, "physicalSizeinMB is %lld ", buf, 0xCu);
  }

  if (v7 >> 22 <= 0x1DA)
    goto LABEL_10;
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_content();
}

void __36__STYDeviceInfo_isMemoryConstrained__block_invoke_cold_1(int a1, int a2, NSObject *a3)
{
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109634;
  v4[1] = a2;
  v5 = 1024;
  v6 = a1;
  v7 = 2080;
  v8 = strerror(a1);
  _os_log_error_impl(&dword_1CB87B000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve memory size. return code : %d errNum : %d errStr: %s", (uint8_t *)v4, 0x18u);
}

@end
