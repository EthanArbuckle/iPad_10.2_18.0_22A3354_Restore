@implementation MultiplayerGroupParticipant

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MultiplayerGroupParticipant"));
}

@end
