@implementation PCSGetStingrayDeathMarker

CFDataRef ____PCSGetStingrayDeathMarker_block_invoke()
{
  CFDataRef result;

  result = CFDataCreate(0, (const UInt8 *)"IUseiCloudKeychain", 18);
  __PCSGetStingrayDeathMarker_deathMarker = (uint64_t)result;
  return result;
}

@end
