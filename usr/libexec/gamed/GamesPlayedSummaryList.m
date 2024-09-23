@implementation GamesPlayedSummaryList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("GamesPlayedSummaryList"));
}

@end
