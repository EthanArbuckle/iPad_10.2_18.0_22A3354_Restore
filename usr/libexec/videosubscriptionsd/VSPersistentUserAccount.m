@implementation VSPersistentUserAccount

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("VSPersistentUserAccount"));
}

@end
