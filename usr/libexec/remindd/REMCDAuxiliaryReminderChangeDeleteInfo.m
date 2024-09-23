@implementation REMCDAuxiliaryReminderChangeDeleteInfo

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return CFSTR("REMCDAuxiliaryReminderChangeDeleteInfo");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDAuxiliaryReminderChangeDeleteInfo"));
}

@end
