@implementation SBFPreheatImageData

void __SBFPreheatImageData_block_invoke_2(uint64_t a1)
{
  CGDataProvider *DataProvider;
  const __CFData *v2;
  const __CFData *v3;
  CFIndex Length;
  UInt8 *BytePtr;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  DataProvider = CGImageGetDataProvider((CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
  if (DataProvider)
  {
    v2 = CGDataProviderCopyData(DataProvider);
    if (v2)
    {
      v3 = v2;
      Length = CFDataGetLength(v2);
      if (Length >= 0x200000)
      {
        SBLogCommon();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __SBFPreheatImageData_block_invoke_2_cold_1(Length, v6, v7, v8, v9, v10, v11, v12);

      }
      else
      {
        BytePtr = (UInt8 *)CFDataGetBytePtr(v3);
        madvise(BytePtr, Length, 3);
      }
      CFRelease(v3);
    }
  }
}

void __SBFPreheatImageData_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01760], "concurrent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoreleaseFrequency:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serviceClass:", 25);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSDispatchQueueCreate();
  v3 = (void *)SBFPreheatImageData_dispatchQueue;
  SBFPreheatImageData_dispatchQueue = v2;

}

void __SBFPreheatImageData_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18AB69000, a2, a3, "Cannot preheat data more than 2MB: %li", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
