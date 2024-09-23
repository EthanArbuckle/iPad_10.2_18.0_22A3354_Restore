@implementation VLGetTraceLog

void __VLGetTraceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VisualLocalization", "Trace");
  v1 = (void *)qword_253E9A238;
  qword_253E9A238 = (uint64_t)v0;

}

@end
