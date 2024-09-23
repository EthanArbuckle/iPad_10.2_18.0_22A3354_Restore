@implementation VGGetUIHelperLog

void __VGGetUIHelperLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "UIHelper");
  v1 = (void *)VGGetUIHelperLog_log;
  VGGetUIHelperLog_log = (uint64_t)v0;

}

@end
