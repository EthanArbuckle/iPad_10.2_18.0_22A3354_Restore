@implementation TUEligibilityChecker

+ (BOOL)isCallRecordingEligible
{
  int domain_answer;
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  domain_answer = os_eligibility_get_domain_answer();
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (domain_answer)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[TUEligibilityChecker isCallRecordingEligible].cold.1(domain_answer, v4);

    return 0;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = 0;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "os_eligibility for OS_ELIGIBILITY_DOMAIN_NICKEL: %llu", buf, 0xCu);
    }

    return 0;
  }
}

+ (void)isCallRecordingEligible
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "os_eligibility_get_domain_answer failed with error %d", (uint8_t *)v2, 8u);
}

@end
