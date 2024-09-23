@implementation PLMomentGenerationGetLog

void __PLMomentGenerationGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "MomentGeneration");
  v1 = (void *)PLMomentGenerationGetLog_log;
  PLMomentGenerationGetLog_log = (uint64_t)v0;

}

@end
