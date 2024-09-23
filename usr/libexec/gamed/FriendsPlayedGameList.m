@implementation FriendsPlayedGameList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("FriendsPlayedGameList"));
}

@end
