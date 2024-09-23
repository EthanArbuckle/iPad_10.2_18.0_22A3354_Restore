@implementation PCInfo

Class __PCInfo_IsUnitTesting_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("XCTestCase"));
  PCInfo_IsUnitTesting::sIsUnitTesting = result != 0;
  return result;
}

@end
