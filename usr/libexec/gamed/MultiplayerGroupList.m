@implementation MultiplayerGroupList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MultiplayerGroupList"));
}

@end
