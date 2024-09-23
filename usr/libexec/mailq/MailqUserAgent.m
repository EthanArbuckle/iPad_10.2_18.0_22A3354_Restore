@implementation MailqUserAgent

- (BOOL)isForeground
{
  return 0;
}

- (BOOL)isMobileMail
{
  return 0;
}

- (BOOL)isMaild
{
  return 0;
}

- (BOOL)isAllowedToAccessProtectedData
{
  return 1;
}

- (BOOL)canRegisterForAPSPush
{
  return 0;
}

- (BOOL)canUseSpotlightIndex
{
  return 0;
}

@end
