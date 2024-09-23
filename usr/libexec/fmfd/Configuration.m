@implementation Configuration

+ (BOOL)FMFServiceUseSSL
{
  return 1;
}

+ (id)FMFServiceService
{
  return CFSTR("/fmipservice/friends/fmfd/");
}

+ (id)setupURL
{
  return CFSTR("https://setup.icloud.com/configurations/init");
}

+ (id)FMFServiceHost
{
  return CFSTR("fmfmobile.icloud.com");
}

+ (id)localizedURLMapping
{
  return CFSTR("https://configuration.apple.com/configurations/internetservices/icloud/fmf/localizedURLs-3.0.plist");
}

@end
