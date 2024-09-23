@implementation SSUserDefaults

void ___SSUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ScreenshotServices"));
  v1 = (void *)_SSUserDefaults_result;
  _SSUserDefaults_result = v0;

}

@end
