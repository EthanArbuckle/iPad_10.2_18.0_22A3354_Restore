@implementation REMCDChangeTrackingState

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDChangeTrackingState"));
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDChangeTrackingState");
}

@end
