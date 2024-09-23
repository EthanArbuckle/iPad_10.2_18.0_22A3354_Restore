@implementation NSPTokenEvent

+ (id)fetchRequest
{
  return objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("NSPTokenEvent"));
}

@end
