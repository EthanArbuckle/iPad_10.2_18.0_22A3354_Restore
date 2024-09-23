@implementation PKLoadNearField

void __PKLoadNearField_block_invoke()
{
  NSObject *v0;
  int v1;
  char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLoadNearField_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 2);
  if (!PKLoadNearField_frameworkLibrary)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = 136315138;
      v2 = dlerror();
      _os_log_impl(&dword_18FC92000, v0, OS_LOG_TYPE_DEFAULT, "Failed to Soft Link NearField.framework: %s", (uint8_t *)&v1, 0xCu);
    }

  }
}

@end
