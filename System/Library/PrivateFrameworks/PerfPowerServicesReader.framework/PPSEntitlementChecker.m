@implementation PPSEntitlementChecker

+ (BOOL)checkForEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  BOOL v9;
  NSObject *v10;
  CFErrorRef error;

  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf(0);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
      CFRelease(v7);
    }
    else
    {
      v9 = 0;
    }
    if (error)
    {
      PPSReaderLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[PPSEntitlementChecker checkForEntitlement:].cold.1((id *)&error, v10);

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)checkForEntitlement:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "+[PPSEntitlementChecker checkForEntitlement:]";
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_2439D9000, a2, OS_LOG_TYPE_DEBUG, "(%s) Error while checking entitlement: %@", (uint8_t *)&v4, 0x16u);

}

@end
