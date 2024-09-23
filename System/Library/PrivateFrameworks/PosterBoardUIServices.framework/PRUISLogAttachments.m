@implementation PRUISLogAttachments

void __PRUISLogAttachments_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardUIServices", "Attachments");
  v1 = (void *)PRUISLogAttachments___logObj;
  PRUISLogAttachments___logObj = (uint64_t)v0;

}

@end
