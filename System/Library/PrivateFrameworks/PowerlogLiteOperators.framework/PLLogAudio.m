@implementation PLLogAudio

void __PLLogAudio_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "audio");
  v1 = (void *)qword_1ED883590;
  qword_1ED883590 = (uint64_t)v0;

}

@end
