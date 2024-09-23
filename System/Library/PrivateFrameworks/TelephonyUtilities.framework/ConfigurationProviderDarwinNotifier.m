@implementation ConfigurationProviderDarwinNotifier

- (void)postConfigurationChanged
{
  notify_post("com.apple.telephonyutilities.configurationChanged");
}

@end
