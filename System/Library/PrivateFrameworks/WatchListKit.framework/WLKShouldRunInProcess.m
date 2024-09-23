@implementation WLKShouldRunInProcess

void __WLKShouldRunInProcess_block_invoke()
{
  if (WLKIsDaemon_onceToken != -1)
    dispatch_once(&WLKIsDaemon_onceToken, &__block_literal_global_31);
  WLKShouldRunInProcess_retVal = WLKIsDaemon_retVal;
}

@end
