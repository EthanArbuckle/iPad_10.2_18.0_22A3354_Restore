@implementation SBWorkspaceLogUsageForAppleCare

void ___SBWorkspaceLogUsageForAppleCare_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_registry_entry_t v7;
  const __CFAllocator *v8;
  const __CFNumber *CFProperty;
  const __CFNumber *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  unsigned int valuePtr;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Logs/AppleSupport/general.log"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    valuePtr = -1;
    v15 = -1;
    v5 = IOServiceMatching("IOPMPowerSource");
    if (v5)
    {
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v5);
      if (MatchingService)
      {
        v7 = MatchingService;
        v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("AppleRawBatteryVoltage"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
        v10 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, CFSTR("Amperage"), v8, 0);
        if (CFProperty)
        {
          CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
          CFRelease(CFProperty);
        }
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberIntType, &v15);
          CFRelease(v10);
        }
        IOObjectRelease(v7);
      }
    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@,%d,%f,%f,%d,%d,%d\n"), v12, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 52), valuePtr, v15);
    v13 = objc_claimAutoreleasedReturnValue();

    -[NSObject dataUsingEncoding:allowLossyConversion:](v13, "dataUsingEncoding:allowLossyConversion:", 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "seekToEndOfFile");
      objc_msgSend(v4, "writeData:", v14);
    }
    objc_msgSend(v4, "closeFile");

  }
  else
  {
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_1();
  }

}

void ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Failed to write usage to %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void ___SBWorkspaceLogUsageForAppleCare_block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "Failed to write usage to %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

@end
