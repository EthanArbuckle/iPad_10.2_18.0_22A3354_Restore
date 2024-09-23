@implementation GKCDLoadedGame

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("GKCDLoadedGame"));
}

@end
