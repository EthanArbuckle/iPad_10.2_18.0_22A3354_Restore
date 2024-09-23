@implementation SBSLockScreenRemoteContentAssertion

+ (id)acquireRemoteContentAssertionWithDefinition:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogCoverSheet();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcEndpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_18EB52000, v8, OS_LOG_TYPE_DEFAULT, "acquiring SBSLockScreenRemoteContentAssertion with user info: %@, endpoint: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", 2, CFSTR("Embedded"), CFSTR("SBDashBoardSleepAssertionIdentifier"), v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_supportsReacquisition
{
  return 1;
}

@end
