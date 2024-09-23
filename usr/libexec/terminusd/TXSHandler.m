@implementation TXSHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEntitlementGroup, 0);
}

@end
