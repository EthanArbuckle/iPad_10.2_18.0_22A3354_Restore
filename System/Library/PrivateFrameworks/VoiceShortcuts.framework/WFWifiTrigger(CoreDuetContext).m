@implementation WFWifiTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForWiFiConnectionSSID");
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "selection");
  if (v4 == 1)
  {
    if (!objc_msgSend(a1, "onConnect") || !objc_msgSend(a1, "onDisconnect"))
    {
      if (objc_msgSend(a1, "onConnect"))
      {
        v14 = (void *)MEMORY[0x1E0D15C90];
        v15 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(a1, "selectedNetworks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "predicateWithFormat:", CFSTR("SELF.%@.value IN %@"), v3, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(a1, "selectedNetworks");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predicateWithFormat:", CFSTR("NOT (SELF.value IN %@)"), v3, v19);
      }
      else
      {
        if (!objc_msgSend(a1, "onDisconnect"))
          goto LABEL_19;
        v14 = (void *)MEMORY[0x1E0D15C90];
        v20 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(a1, "selectedNetworks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "predicateWithFormat:", CFSTR("NOT (SELF.%@.value IN %@)"), v3, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(a1, "selectedNetworks");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predicateWithFormat:", CFSTR("SELF.value IN %@"), v3, v19);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v17, v22, 0.0);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    v5 = (void *)MEMORY[0x1E0D15C90];
    v6 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(a1, "selectedNetworks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "selectedNetworks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithFormat:", CFSTR("SELF.%@.value IN %@ OR NOT (SELF.%@.value in %@)"), v3, v7, v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(a1, "selectedNetworks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "selectedNetworks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("NOT (SELF.value IN %@) OR SELF.value IN %@"), v3, v11, v3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v9, v13, 0.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (!v4)
  {
    if (objc_msgSend(a1, "onConnect") && objc_msgSend(a1, "onDisconnect"))
    {
      objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value != nil OR SELF.%@.value == nil"), v3, v3);
LABEL_15:
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    if (objc_msgSend(a1, "onConnect"))
    {
      objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value != nil"), v3, v24);
      goto LABEL_15;
    }
    if (objc_msgSend(a1, "onDisconnect"))
    {
      objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value == nil"), v3, v24);
      goto LABEL_15;
    }
LABEL_19:
    v1 = 0;
  }
LABEL_20:

  return v1;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
