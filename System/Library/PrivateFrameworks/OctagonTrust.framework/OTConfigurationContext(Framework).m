@implementation OTConfigurationContext(Framework)

- (void)setEscrowAuth:()Framework
{
  objc_setAssociatedObject(a1, CFSTR("kOTEscrowAuthKey"), a3, 0);
}

- (id)escrowAuth
{
  return objc_getAssociatedObject(a1, CFSTR("kOTEscrowAuthKey"));
}

@end
