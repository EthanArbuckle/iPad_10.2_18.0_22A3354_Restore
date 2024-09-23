@implementation WFAppInFocusTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAppDataDictionary");
}

- (id)contextStorePredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "selectedBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D15C90];
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "onFocusIgnoredLaunchReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("SELF.%@.value.%K IN %@ AND NOT (SELF.%@.value.%K IN %@)"), v3, v29, v2, v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("NOT (SELF.value.%K IN %@) AND NOT (SELF.value.%K IN %@)"), v9, v2, v10, v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v7, v11, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D15C90];
  v12 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "onBackgroundIgnoredLaunchReasons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("NOT (SELF.%@.value.%K IN %@) AND NOT (SELF.%@.value.%K IN %@)"), v3, v13, v2, v3, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateWithFormat:", CFSTR("SELF.value.%K IN %@ AND SELF.value.%K IN %@"), v18, v2, v19, v2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v30;
  v31 = (void *)v3;
  objc_msgSend(v21, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v3, v16, v20, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "onFocus") && objc_msgSend(a1, "onBackground"))
  {
    v23 = (void *)MEMORY[0x1E0D15C90];
    v24 = v33;
    v34[0] = v33;
    v34[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "orPredicateWithSubpredicates:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(a1, "onFocus"))
    {
      v24 = v33;
      v27 = v33;
    }
    else
    {
      v24 = v33;
      if (!objc_msgSend(a1, "onBackground"))
      {
        v26 = 0;
        goto LABEL_10;
      }
      v27 = v22;
    }
    v26 = v27;
  }
LABEL_10:

  return v26;
}

- (id)onBackgroundIgnoredLaunchReasons
{
  void *v0;
  void *v1;
  char v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("com.apple.SpringBoard.backlight.transitionReason.lockButton"), CFSTR("com.apple.SpringBoard.backlight.transitionReason.idleTimer"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasCapability:", *MEMORY[0x1E0DC80D8]);

  if ((v2 & 1) == 0)
    objc_msgSend(v0, "addObject:", &stru_1E7AA8740);
  return v0;
}

- (void)onFocusIgnoredLaunchReasons
{
  return &unk_1E7ABF708;
}

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t (**v10)(_QWORD);
  id v11;
  id v12;
  uint64_t (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD aBlock[4];
  id v24;
  id v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NewValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OldValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke;
  aBlock[3] = &unk_1E7AA6608;
  v8 = v5;
  v24 = v8;
  v9 = v6;
  v25 = v9;
  v26 = a1;
  v10 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  v16 = v7;
  v17 = 3221225472;
  v18 = __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke_2;
  v19 = &unk_1E7AA6608;
  v20 = v9;
  v21 = v8;
  v22 = a1;
  v11 = v8;
  v12 = v9;
  v13 = (uint64_t (**)(_QWORD))_Block_copy(&v16);
  if (objc_msgSend(a1, "onFocus", v16, v17, v18, v19) && (v10[2](v10) & 1) != 0)
  {
    v14 = 1;
  }
  else if (objc_msgSend(a1, "onBackground"))
  {
    v14 = v13[2](v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

@end
