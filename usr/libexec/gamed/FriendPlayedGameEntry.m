@implementation FriendPlayedGameEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("FriendPlayedGameEntry"));
}

@end
