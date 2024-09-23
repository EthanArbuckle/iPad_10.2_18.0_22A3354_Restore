@implementation AMFDRIsNonDefaultDemotionState

uint64_t __AMFDRIsNonDefaultDemotionState_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  CFTypeID v4;
  CFTypeID v5;
  BOOL v6;

  v0 = AMFDRSealingMapCallMGCopyAnswer(CFSTR("CertificateSecurityMode"), 0);
  v1 = AMFDRSealingMapCallMGCopyAnswer(CFSTR("EffectiveSecurityModeSEP"), 0);
  v2 = AMFDRSealingMapCallMGCopyAnswer(CFSTR("EffectiveProductionStatusAp"), 0);
  if (v0)
  {
    v3 = CFGetTypeID(v0);
    if (v3 == CFBooleanGetTypeID())
    {
      if (v1)
      {
        v4 = CFGetTypeID(v1);
        if (v4 == CFBooleanGetTypeID())
        {
          if (v2)
          {
            v5 = CFGetTypeID(v2);
            if (v5 == CFBooleanGetTypeID())
            {
              v6 = CFBooleanGetValue((CFBooleanRef)v0)
                && CFBooleanGetValue((CFBooleanRef)v1)
                && CFBooleanGetValue((CFBooleanRef)v2) == 0;
              AMFDRIsNonDefaultDemotionState_result = v6;
            }
          }
        }
      }
    }
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return AMSupportSafeRelease();
}

@end
