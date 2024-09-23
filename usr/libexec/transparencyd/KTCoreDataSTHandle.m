@implementation KTCoreDataSTHandle

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("STStaticKeyHandle"));
}

@end
