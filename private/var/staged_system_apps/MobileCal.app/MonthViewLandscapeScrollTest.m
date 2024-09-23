@implementation MonthViewLandscapeScrollTest

- (id)checkTestPreconditions
{
  uint64_t v2;
  uint64_t v3;
  id result;

  v3 = EKUICurrentWindowInterfaceParadigm(0, a2);
  result = 0;
  if (v3 != 16)
  {
    if (EKUIUseLargeFormatPhoneUI(0, v2))
      return 0;
    else
      return CFSTR("Test cannot be run on devices with compact width in landscape");
  }
  return result;
}

- (void)runTest
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000BCB0C;
  v2[3] = &unk_1001B25D0;
  v2[4] = self;
  objc_msgSend(UIApp, "rotateIfNeeded:completion:", 3, v2);
}

@end
