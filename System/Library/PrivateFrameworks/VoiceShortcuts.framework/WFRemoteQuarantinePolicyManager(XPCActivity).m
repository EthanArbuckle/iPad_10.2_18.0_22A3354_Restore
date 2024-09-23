@implementation WFRemoteQuarantinePolicyManager(XPCActivity)

- (void)scheduleRegularPolicyUpdatesWithDatabaseProvider:()XPCActivity
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFRemoteQuarantinePolicyManager(XPCActivity) scheduleRegularPolicyUpdatesWithDatabaseProvider:]";
    v13 = 2112;
    v14 = CFSTR("com.apple.siriactionsd.RemoteQuarantineUpdate");
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s Scheduling remote quarantine bundle update activity: (%@)", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__WFRemoteQuarantinePolicyManager_XPCActivity__scheduleRegularPolicyUpdatesWithDatabaseProvider___block_invoke;
  v8[3] = &unk_1E7AA6D08;
  v9 = v4;
  v10 = a1;
  v6 = v4;
  v7 = +[WFXPCActivityScheduler activatedSchedulerWithActivityIdentifier:runHandler:](WFXPCActivityScheduler, "activatedSchedulerWithActivityIdentifier:runHandler:", CFSTR("com.apple.siriactionsd.RemoteQuarantineUpdate"), v8);

}

@end
