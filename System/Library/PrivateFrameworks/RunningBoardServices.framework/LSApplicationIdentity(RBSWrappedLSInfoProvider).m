@implementation LSApplicationIdentity(RBSWrappedLSInfoProvider)

- (id)fetchWrappedInfoWithError:()RBSWrappedLSInfoProvider
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  int v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "findApplicationRecordWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "personaUniqueString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jobLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSWrappedLSInfo infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:](RBSWrappedLSInfo, "infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:", v7, v8, v9, objc_msgSend(v6, "platform"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    rbs_general_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (a3)
      {
        objc_msgSend(*a3, "description");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("<>");
      }
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_190CD6000, v11, OS_LOG_TYPE_INFO, "fetchWrappedInfoWithError failed due to %{public}@", (uint8_t *)&v14, 0xCu);
      if (a3)

    }
    v10 = 0;
  }

  return v10;
}

@end
