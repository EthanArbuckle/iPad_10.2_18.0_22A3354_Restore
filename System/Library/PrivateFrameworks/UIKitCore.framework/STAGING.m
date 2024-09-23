@implementation STAGING

void __keyboardui_system_get_log_STAGING_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KeyboardUISignpostsSystem");
  v1 = (void *)qword_1ECD7D930;
  qword_1ECD7D930 = (uint64_t)v0;

}

@end
