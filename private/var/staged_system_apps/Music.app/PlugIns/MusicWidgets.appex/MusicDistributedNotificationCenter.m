@implementation MusicDistributedNotificationCenter

+ (id)default
{
  return +[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter");
}

@end
