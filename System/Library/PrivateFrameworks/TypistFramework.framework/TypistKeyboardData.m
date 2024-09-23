@implementation TypistKeyboardData

+ (Class)keyboardData
{
  objc_msgSend(a1, "isKeyboardUIOutOfProcess");
  return (Class)(id)objc_opt_class();
}

+ (BOOL)isKeyboardUIOutOfProcess
{
  if (isKeyboardUIOutOfProcess_onceToken != -1)
    dispatch_once(&isKeyboardUIOutOfProcess_onceToken, &__block_literal_global_5);
  return isKeyboardUIOutOfProcess_oop;
}

uint64_t __46__TypistKeyboardData_isKeyboardUIOutOfProcess__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDF6B18], "usesInputSystemUI");
  isKeyboardUIOutOfProcess_oop = result;
  return result;
}

@end
