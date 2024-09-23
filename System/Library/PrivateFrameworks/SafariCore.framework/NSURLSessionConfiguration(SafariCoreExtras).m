@implementation NSURLSessionConfiguration(SafariCoreExtras)

+ (id)safari_ephemeralSessionConfiguration
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "set_loggingPrivacyLevel:", 3);
  return v0;
}

@end
