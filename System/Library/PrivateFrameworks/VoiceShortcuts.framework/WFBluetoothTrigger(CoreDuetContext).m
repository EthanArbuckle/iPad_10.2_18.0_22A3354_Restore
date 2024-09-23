@implementation WFBluetoothTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForBluetoothDataDictionary");
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
  void *v16;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "selection");
  if (v4 == 1)
  {
    if (objc_msgSend(a1, "onConnect") && objc_msgSend(a1, "onDisconnect"))
    {
      v5 = (void *)MEMORY[0x1E0D15C90];
      goto LABEL_9;
    }
    if (objc_msgSend(a1, "onConnect"))
    {
      v6 = (void *)MEMORY[0x1E0D15C90];
      v7 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "selectedDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "predicateWithFormat:", CFSTR("SELF.%@.value IN %@"), v3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "selectedDevices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateWithFormat:", CFSTR("NOT (SELF.value IN %@)"), v3, v11);
    }
    else
    {
      if (!objc_msgSend(a1, "onDisconnect"))
        goto LABEL_20;
      v6 = (void *)MEMORY[0x1E0D15C90];
      v12 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "selectedDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("NOT (SELF.%@.value IN %@)"), v3, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "selectedDevices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateWithFormat:", CFSTR("SELF.value IN %@"), v3, v11);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v9, v14, 0.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  if (!v4)
  {
    if (objc_msgSend(a1, "onConnect") && objc_msgSend(a1, "onDisconnect"))
    {
      v5 = (void *)MEMORY[0x1E0D15C90];
      v16 = v3;
LABEL_9:
      objc_msgSend(v5, "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value != nil OR SELF.%@.value == nil"), v3, v16);
LABEL_16:
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (objc_msgSend(a1, "onConnect"))
    {
      objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value != nil"), v3, v16);
      goto LABEL_16;
    }
    if (objc_msgSend(a1, "onDisconnect"))
    {
      objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value == nil"), v3, v16);
      goto LABEL_16;
    }
LABEL_20:
    v1 = 0;
  }
LABEL_21:

  return v1;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
