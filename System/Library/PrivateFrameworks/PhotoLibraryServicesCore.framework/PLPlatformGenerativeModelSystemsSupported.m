@implementation PLPlatformGenerativeModelSystemsSupported

void __PLPlatformGenerativeModelSystemsSupported_block_invoke()
{
  int domain_answer;
  int v1;
  char *v2;
  void *v3;
  int v4;
  uint8_t buf[4];
  int v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v1 = domain_answer;
    v2 = strerror(domain_answer);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v6 = v1;
      v7 = 2080;
      v8 = v2;
      _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "os_eligibility_get_domain_answer failed with errno %d: %s", buf, 0x12u);
    }
  }
  else
  {
    PLPlatformGenerativeModelSystemsSupported_gmSupported = 0;
    if (PFOSVariantHasInternalDiagnostics())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PLPlatformGenerativeModelSystemsSupported"));

      if (v4)
      {
        PLPlatformGenerativeModelSystemsSupported_gmSupported = 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLPlatformGenerativeModelSystemsSupported is overridden to YES via defaults", buf, 2u);
        }
      }
    }
  }
}

@end
