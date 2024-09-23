@implementation REMCKSharedObjectOwnerName

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCKSharedObjectOwnerName");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCKSharedObjectOwnerName"));
}

@end
