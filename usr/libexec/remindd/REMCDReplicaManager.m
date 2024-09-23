@implementation REMCDReplicaManager

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDReplicaManager"));
}

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDReplicaManager");
}

@end
