@implementation STDistributionEligibility

+ (BOOL)evaluateEligibilityForAppDistribution
{
  int v2;
  int domain_answer;
  NSObject *v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    domain_answer = os_eligibility_get_domain_answer();
    if (domain_answer | os_eligibility_get_domain_answer())
    {
      +[STUILog contentPrivacy](STUILog, "contentPrivacy");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[STDistributionEligibility evaluateEligibilityForAppDistribution].cold.1(v4);

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return v2;
}

+ (void)evaluateEligibilityForAppDistribution
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219AB4000, log, OS_LOG_TYPE_FAULT, "Failure checking distribution eligibility", v1, 2u);
}

@end
