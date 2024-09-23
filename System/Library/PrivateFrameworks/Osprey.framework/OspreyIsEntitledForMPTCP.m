@implementation OspreyIsEntitledForMPTCP

BOOL __OspreyIsEntitledForMPTCP_block_invoke()
{
  _BOOL8 result;

  result = OspreyEntitlementBoolValue();
  OspreyIsEntitledForMPTCP_entitled = result;
  return result;
}

@end
