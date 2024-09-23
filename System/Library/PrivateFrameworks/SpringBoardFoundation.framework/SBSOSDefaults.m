@implementation SBSOSDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disablesForAccessibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDisablesSOSForAccessibility"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "performedCheckForTripleClickSOSMigrationAlert");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBPerformedCheckForTripleClickSOSMigrationAlert"), v4, 1);

}

- (int64_t)lockButtonSOSTriggerCount
{
  unint64_t v2;
  NSObject *v4;

  v2 = objc_msgSend(getSOSUtilitiesClass(), "SOSTriggerClickCount");
  if (v2 > 5 || ((1 << v2) & 0x29) == 0)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSOSDefaults lockButtonSOSTriggerCount].cold.1(v2, v4);

    return -1;
  }
  return v2;
}

- (BOOL)clawCanTriggerSOS
{
  return objc_msgSend(getSOSUtilitiesClass(), "canTriggerSOSWithVolumeLockHold");
}

- (BOOL)isAutomaticCallCountdownEnabled
{
  return objc_msgSend(getSOSUtilitiesClass(), "isAutomaticCallCountdownEnabled");
}

- (void)lockButtonSOSTriggerCount
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18AB69000, a2, OS_LOG_TYPE_ERROR, "SBSOSDefaults - Unsupported Lock Button Trigger Click Count: %d.", (uint8_t *)v2, 8u);
}

@end
