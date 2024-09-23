@implementation WFBatteryLevelTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBatteryLevel");
}

- (id)contextStorePredicate
{
  void *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "selection");
  switch(v4)
  {
    case 2:
      v9 = (void *)MEMORY[0x1E0D15C90];
      v10 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateWithFormat:", CFSTR("SELF.%@.value < %@"), v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateWithFormat:", CFSTR("SELF.value >= %@"), v12);
LABEL_7:
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v8, v15, 0.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    case 1:
      v9 = (void *)MEMORY[0x1E0D15C90];
      v13 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateWithFormat:", CFSTR("SELF.%@.value > %@"), v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateWithFormat:", CFSTR("SELF.value <= %@"), v12);
      goto LABEL_7;
    case 0:
      v5 = (void *)MEMORY[0x1E0D15C90];
      v6 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicateWithFormat:", CFSTR("SELF.%@.value == %@"), v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateForKeyPath:withPredicate:", v3, v8);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      break;
  }

  return v1;
}

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

@end
