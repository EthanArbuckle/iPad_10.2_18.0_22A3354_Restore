@implementation SFIsRunningUnitTests

void __SFIsRunningUnitTests_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("XCTestBundlePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 || NSClassFromString(CFSTR("XCTestCase")))
    SFIsRunningUnitTests_result = 1;
}

@end
