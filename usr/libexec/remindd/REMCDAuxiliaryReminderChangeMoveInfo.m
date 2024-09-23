@implementation REMCDAuxiliaryReminderChangeMoveInfo

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return CFSTR("REMCDAuxiliaryReminderChangeMoveInfo");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAuxiliaryReminderChangeMoveInfo"));
}

@end
