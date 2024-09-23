@implementation LogTTSVBTrain

void __LogTTSVBTrain_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BDFE1A8], "TTSVBTrain");
  v1 = (void *)LogTTSVBTrain__logObj;
  LogTTSVBTrain__logObj = (uint64_t)v0;

}

@end
