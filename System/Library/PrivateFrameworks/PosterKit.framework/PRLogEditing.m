@implementation PRLogEditing

void __PRLogEditing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterKit", "Editing");
  v1 = (void *)PRLogEditing___logObj;
  PRLogEditing___logObj = (uint64_t)v0;

}

@end
