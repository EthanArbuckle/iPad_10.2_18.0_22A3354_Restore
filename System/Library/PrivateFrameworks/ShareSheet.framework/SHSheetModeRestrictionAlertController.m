@implementation SHSheetModeRestrictionAlertController

uint64_t __SHSheetModeRestrictionAlertController_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __SHSheetModeRestrictionAlertController_block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t result;
  void *v15;
  void *v16;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "alertRecoverySuggestionButtonLaunchURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*v2, "alertRecoverySuggestionButtonLaunchURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("prefs"));

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "alertRecoverySuggestionButtonLaunchURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v16 = 0;
      LOBYTE(v10) = objc_msgSend(v8, "openSensitiveURL:withOptions:error:", v9, 0, &v16);
      v11 = v16;
    }
    else
    {
      v15 = 0;
      v10 = objc_msgSend(v8, "openURL:withOptions:error:", v9, 0, &v15);
      v11 = v15;
    }
    v12 = v11;

    if ((v10 & 1) == 0)
    {
      share_sheet_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __SHSheetModeRestrictionAlertController_block_invoke_2_cold_1(v2, (uint64_t)v12, v13);

    }
  }
  if ((objc_msgSend(*v2, "allowContinueToMode") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_cancel");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __SHSheetModeRestrictionAlertController_block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "alertRecoverySuggestionButtonLaunchURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_19E419000, a3, OS_LOG_TYPE_ERROR, "### Launch URL failed: %@, %@\n", (uint8_t *)&v6, 0x16u);

}

@end
