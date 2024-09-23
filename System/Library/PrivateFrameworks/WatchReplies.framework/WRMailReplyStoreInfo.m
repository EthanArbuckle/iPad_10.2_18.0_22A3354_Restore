@implementation WRMailReplyStoreInfo

- (unint64_t)defaultCount
{
  return 13;
}

- (id)defaultsDomain
{
  return CFSTR("com.apple.NanoMail");
}

- (id)defaultsKey
{
  return CFSTR("NanoMailCannedRepliesArray");
}

- (id)defaultsChangedNotificationName
{
  return CFSTR("com.apple.NanoMail.NanoMailCannedRepliesArray.changed");
}

@end
