@implementation WFAppInFocusTrigger

uint64_t __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E7AA8740;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 == CFSTR("SBFullScreenSwitcherSceneLiveContentOverlay")
      || v13
      && (v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("SBFullScreenSwitcherSceneLiveContentOverlay")), v14, v15))
    {
      v16 = v10;
      if (v16 == CFSTR("com.apple.CoreAuthUI"))
      {
        v19 = 0;
        goto LABEL_16;
      }
      v17 = v16;
      v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

      if ((v18 & 1) != 0)
      {
        v19 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 48), "selectedBundleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "containsObject:", v4))
    {
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 48), "selectedBundleIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "containsObject:", v10) ^ 1;
LABEL_16:

    goto LABEL_17;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

uint64_t __77__WFAppInFocusTrigger_CoreDuetContext__shouldFireTriggerWithEventInfo_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E7AA8740;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D15C58], "appLaunchReasonKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 == CFSTR("SBFullScreenSwitcherSceneLiveContentOverlay")
      || v13
      && (v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("SBFullScreenSwitcherSceneLiveContentOverlay")), v14, v15))
    {
      v16 = v10;
      if (v16 == CFSTR("com.apple.CoreAuthUI"))
      {
        v19 = 0;
        goto LABEL_16;
      }
      v17 = v16;
      v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("com.apple.CoreAuthUI"));

      if ((v18 & 1) != 0)
      {
        v19 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 48), "selectedBundleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "containsObject:", v4))
    {
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 48), "selectedBundleIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "containsObject:", v10) ^ 1;
LABEL_16:

    goto LABEL_17;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

@end
