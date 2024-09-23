@implementation LogTTSVBSiri

void __LogTTSVBSiri_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BDFE1A8], "TTSVBSiri");
  v1 = (void *)LogTTSVBSiri__logObj;
  LogTTSVBSiri__logObj = (uint64_t)v0;

}

@end
