@implementation LSApplicationWorkspace(SafariCoreExtras)

- (void)safari_setDefaultURLHandlerForScheme:()SafariCoreExtras toApplicationWithBundleIdentifier:completionHandler:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_INFO, "Attempting to set default URL handler for scheme %@ to bundle ID %@", buf, 0x16u);
  }
  v19 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, &v19);
  v13 = v19;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __133__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultURLHandlerForScheme_toApplicationWithBundleIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E649C898;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    objc_msgSend(a1, "setDefaultURLHandlerForScheme:to:completion:", v16, v12, v15);

  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[LSApplicationWorkspace(SafariCoreExtras) safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:].cold.1((uint64_t)v9, v14, v13);
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

- (void)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __168__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke;
  v10[3] = &unk_1E649C8C0;
  v12 = a4;
  v10[4] = a1;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("otpauth"), a3, v10);

}

- (uint64_t)safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultOTPAuthURLHandlerToApplicationWithBundleIdentifier:shouldFallBackToSystemHandlerIfNeeded:completionHandler:", a3, 1, a4);
}

- (uint64_t)safari_setAppleOTPAuthURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("apple-otpauth"), a3, a4);
}

- (void)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras shouldFallBackToSystemHandlerIfNeeded:completionHandler:
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __177__LSApplicationWorkspace_SafariCoreExtras__safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier_shouldFallBackToSystemHandlerIfNeeded_completionHandler___block_invoke;
  v10[3] = &unk_1E649C8C0;
  v12 = a4;
  v10[4] = a1;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("otpauth-migration"), a3, v10);

}

- (uint64_t)safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:shouldFallBackToSystemHandlerIfNeeded:completionHandler:", a3, 1, a4);
}

- (uint64_t)safari_setAppleOTPAuthMigrationURLHandlerToApplicationWithBundleIdentifier:()SafariCoreExtras completionHandler:
{
  return objc_msgSend(a1, "safari_setDefaultURLHandlerForScheme:toApplicationWithBundleIdentifier:completionHandler:", CFSTR("apple-otpauth-migration"), a3, a4);
}

- (void)safari_setDefaultURLHandlerForScheme:()SafariCoreExtras toApplicationWithBundleIdentifier:completionHandler:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1B2621000, v5, OS_LOG_TYPE_ERROR, "Failed to load application record for bundle ID %@; error=%{public}@",
    (uint8_t *)&v7,
    0x16u);

}

@end
