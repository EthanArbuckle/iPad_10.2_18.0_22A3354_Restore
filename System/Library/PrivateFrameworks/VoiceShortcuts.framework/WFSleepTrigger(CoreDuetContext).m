@implementation WFSleepTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/system/currentSleepState"));
}

- (id)contextStorePredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "selection");
  if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0D15C90];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.%@.value.%K = %@ OR SELF.%@.value.%K = %@"), v2, CFSTR("sleepScheduleState"), &unk_1E7ABF498, v2, CFSTR("sleepScheduleState"), &unk_1E7ABF498);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.value.%K = %@ OR SELF.value.%K = %@"), CFSTR("sleepScheduleState"), &unk_1E7ABF4B0, CFSTR("sleepScheduleState"), &unk_1E7ABF510);
  }
  else if (v3 == 1)
  {
    v4 = (void *)MEMORY[0x1E0D15C90];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.%@.value.%K = %@"), v2, CFSTR("sleepModeState"), &unk_1E7ABF4B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.value.%K != %@"), CFSTR("sleepModeState"), &unk_1E7ABF4B0, v9, v10);
  }
  else
  {
    if (v3)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v4 = (void *)MEMORY[0x1E0D15C90];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.%@.value.%K = %@ AND SELF.%@.value.%K = %@"), v2, CFSTR("sleepModeState"), &unk_1E7ABF498, v2, CFSTR("sleepModeState"), &unk_1E7ABF498);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.value.%K != %@ AND SELF.value.%K != %@"), CFSTR("sleepModeState"), &unk_1E7ABF498, CFSTR("sleepModeState"), &unk_1E7ABF4B0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v2, v5, v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
