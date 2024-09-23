@implementation BlacklistMO

+ (id)entityName
{
  return CFSTR("Blacklist");
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Blacklist"));
}

@end
