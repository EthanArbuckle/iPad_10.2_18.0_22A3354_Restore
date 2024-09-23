@implementation UIApplication(SUPPT)

- (void)beginPPTWithName:()SUPPT
{
  if ((void *)__CurrentTestName != a3)
  {

    __CurrentTestName = a3;
  }
}

- (void)endCurrentPPT
{
  objc_msgSend(a1, "finishedTest:extraResults:", __CurrentTestName, 0);

  __CurrentTestName = 0;
}

@end
