@implementation SDBuildInfo

+ (BOOL)currentBuildIsSeed
{
  return 0;
}

+ (BOOL)isFeedbackAssistantAvailable
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  char v6;
  void *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("applefeedback://"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA58A8]), "initWithURL:error:", v2, &v9);
  v4 = v9;
  if (v4)
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SDBuildInfo isFeedbackAssistantAvailable].cold.1((uint64_t)v4, v5);
    v6 = 0;
  }
  else
  {
    if (!v3)
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v3, "bundleRecord");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", CFSTR("com.apple.appleseed.FeedbackAssistant"));

  }
LABEL_8:

  return v6;
}

+ (void)isFeedbackAssistantAvailable
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_ERROR, "Error checking FBA url scheme %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
