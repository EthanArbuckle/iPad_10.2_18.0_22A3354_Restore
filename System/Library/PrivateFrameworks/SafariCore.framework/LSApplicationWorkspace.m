@implementation LSApplicationWorkspace

void __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke_cold_1(a1, v7, v5);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

void __168__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  void (*v5)(void);
  id v6;

  v6 = a3;
  if ((a2 & 1) != 0)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("otpauth"), CFSTR("com.apple.Preferences"), *(_QWORD *)(a1 + 40));
LABEL_7:

}

void __177__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  void (*v5)(void);
  id v6;

  v6 = a3;
  if ((a2 & 1) != 0)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("otpauth-migration"), CFSTR("com.apple.Preferences"), *(_QWORD *)(a1 + 40));
LABEL_7:

}

void __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1B2621000, v6, OS_LOG_TYPE_ERROR, "Failed to set default URL handler for scheme %@ to bundle ID %@; error=%{public}@",
    (uint8_t *)&v8,
    0x20u);

}

@end
