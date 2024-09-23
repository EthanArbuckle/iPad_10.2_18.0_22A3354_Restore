@implementation REMCDBaseList

+ (BOOL)isAbstract
{
  return 1;
}

+ (id)cdEntityName
{
  return CFSTR("REMCDBaseList");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDBaseList"));
}

@end
