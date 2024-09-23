@implementation PRUISLogRemoteEditing

void __PRUISLogRemoteEditing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardUIServices", "RemoteEditing");
  v1 = (void *)PRUISLogRemoteEditing___logObj;
  PRUISLogRemoteEditing___logObj = (uint64_t)v0;

}

@end
