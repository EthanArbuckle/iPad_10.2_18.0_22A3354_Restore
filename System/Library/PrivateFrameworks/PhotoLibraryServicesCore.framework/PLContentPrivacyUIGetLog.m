@implementation PLContentPrivacyUIGetLog

void __PLContentPrivacyUIGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "ContentPrivacyUI");
  v1 = (void *)PLContentPrivacyUIGetLog_log;
  PLContentPrivacyUIGetLog_log = (uint64_t)v0;

}

@end
