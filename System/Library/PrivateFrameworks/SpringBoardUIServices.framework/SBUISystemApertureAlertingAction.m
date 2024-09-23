@implementation SBUISystemApertureAlertingAction

- (void)invalidateWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  SBUISystemApertureAlertingAction *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemApertureHosting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Alerting action invalidated with reason: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  if (-[SBUISystemApertureAlertingAction canSendResponse](self, "canSendResponse"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D017D0]);
    objc_msgSend(v6, "setObject:forSetting:", v4, 0);
    objc_msgSend(MEMORY[0x1E0D016A8], "responseWithInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISystemApertureAlertingAction sendResponse:](self, "sendResponse:", v7);

  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("invalidation reason");
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = v6;
  if (a5)
    v8 = 0;
  else
    v8 = v6;

  return v8;
}

@end
