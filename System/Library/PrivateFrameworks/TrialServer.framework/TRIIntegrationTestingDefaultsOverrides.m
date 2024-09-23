@implementation TRIIntegrationTestingDefaultsOverrides

+ (BOOL)shouldUseIntegrationTestLogger
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.triald.use-integration-test-logger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("com.apple.triald.use-integration-test-logger"));
  else
    v4 = 0;

  return v4;
}

+ (id)integrationTestLoggerDefaultsName
{
  return CFSTR("com.apple.triald.use-integration-test-logger");
}

@end
