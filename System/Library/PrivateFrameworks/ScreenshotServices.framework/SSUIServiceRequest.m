@implementation SSUIServiceRequest

+ (id)entitlement
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Bare SSUIServiceRequest sent to SSUIServiceServer"), 0);
  return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
