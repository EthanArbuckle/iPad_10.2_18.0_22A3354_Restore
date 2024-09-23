@implementation SBSLockScreenBackgroundContentAssertion

+ (id)acquireBackgroundContentAssertionWithDefinition:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    SBLogCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18EB52000, v8, OS_LOG_TYPE_DEFAULT, "Acquiring SBSLockScreenBackgroundContentAssertion", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", 2, CFSTR("Background"), CFSTR("SBDashBoardBackgroundContentAssertionIdentifier"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2D68];
    v17[0] = CFSTR("Feature not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSLockScreenContentAssertionErrorDomain"), 4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogCoverSheet();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_18EB52000, v12, OS_LOG_TYPE_DEFAULT, "Failed to acquire SBSLockScreenBackgroundContentAssertion: %@", (uint8_t *)&v14, 0xCu);
    }

    if (v7)
      v7[2](v7, v11);

    v9 = 0;
  }

  return v9;
}

- (BOOL)_supportsReacquisition
{
  return 1;
}

@end
