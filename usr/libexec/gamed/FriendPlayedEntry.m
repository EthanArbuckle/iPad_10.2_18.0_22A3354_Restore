@implementation FriendPlayedEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("FriendPlayedEntry"));
}

@end
