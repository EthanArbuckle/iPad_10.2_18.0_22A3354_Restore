@implementation WLKIsRunningTest

void __WLKIsRunningTest_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  WLKIsRunningTest_retVal = objc_msgSend(v0, "isEqualToString:", CFSTR("WatchListKitUnitTestsRunner"));

}

@end
