@implementation WRMessagesReplyStoreInfo

- (unint64_t)defaultCount
{
  return 5;
}

- (id)defaultsDomain
{
  return CFSTR("com.apple.MobileSMS");
}

- (id)defaultsKey
{
  return CFSTR("CKNanoCannedRepliesArray");
}

- (id)defaultsChangedNotificationName
{
  return CFSTR("com.apple.MobileSMS.CKNanoCannedRepliesArray.changed");
}

- (BOOL)supportsSmartReplies
{
  return 1;
}

@end
