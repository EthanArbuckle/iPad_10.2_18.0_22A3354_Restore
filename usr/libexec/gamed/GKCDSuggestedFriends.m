@implementation GKCDSuggestedFriends

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("SuggestedFriends"));
}

@end
