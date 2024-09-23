@implementation PhonePlusRotationTest

- (id)checkTestPreconditions
{
  if (EKUIUseLargeFormatPhoneUI(self, a2))
    return 0;
  else
    return CFSTR("Test cannot be run on non-plus-sized phones");
}

@end
