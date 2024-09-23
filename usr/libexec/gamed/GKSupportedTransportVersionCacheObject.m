@implementation GKSupportedTransportVersionCacheObject

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("SupportedTransportVersion"));
}

@end
