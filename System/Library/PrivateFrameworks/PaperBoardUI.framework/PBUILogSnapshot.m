@implementation PBUILogSnapshot

void __PBUILogSnapshot_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PaperBoardUI", "Snapshot");
  v1 = (void *)PBUILogSnapshot___logObj;
  PBUILogSnapshot___logObj = (uint64_t)v0;

}

@end
