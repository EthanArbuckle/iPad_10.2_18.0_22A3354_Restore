@implementation PRUISLogEditing

void __PRUISLogEditing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardUIServices", "Editing");
  v1 = (void *)PRUISLogEditing___logObj;
  PRUISLogEditing___logObj = (uint64_t)v0;

}

@end
