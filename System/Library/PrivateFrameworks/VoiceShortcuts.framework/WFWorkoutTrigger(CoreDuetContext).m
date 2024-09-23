@implementation WFWorkoutTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForWorkoutDataDictionary");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "onStart"))
  {
    softLink_HKWorkoutSessionStateName(2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(a1, "onEnd"))
  {
    softLink_HKWorkoutSessionStateName(3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = objc_msgSend(a1, "selection");
  if (v5 == 1)
  {
    objc_msgSend(a1, "selectedWorkoutTypes");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v7 = 0;
      goto LABEL_11;
    }
    -[objc_class _allWorkoutActivityTypes](getHKWorkoutClass(), "_allWorkoutActivityTypes");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_11:
  v8 = (void *)MEMORY[0x1E0D15CA0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForFirstPartyWorkoutMatchingTypes:states:", v9, v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (uint64_t)contextStoreRegistrationIsForWatch
{
  return 1;
}

@end
