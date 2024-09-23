@implementation UIKitUserDefaults

void ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = (void *)_UIKitUserDefaults_result;
  _UIKitUserDefaults_result = v0;

}

@end
