@implementation KTDeviceRecord

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTDeviceRecord"));
}

@end
