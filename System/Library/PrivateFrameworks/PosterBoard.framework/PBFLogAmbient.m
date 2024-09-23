@implementation PBFLogAmbient

void __PBFLogAmbient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Ambient");
  v1 = (void *)PBFLogAmbient___logObj;
  PBFLogAmbient___logObj = (uint64_t)v0;

}

@end
