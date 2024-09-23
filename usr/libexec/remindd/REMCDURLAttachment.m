@implementation REMCDURLAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMURLAttachment cdEntityName](REMURLAttachment, "cdEntityName");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDURLAttachment"));
}

@end
