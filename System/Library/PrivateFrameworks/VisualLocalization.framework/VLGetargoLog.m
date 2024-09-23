@implementation VLGetargoLog

void __VLGetargoLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.VisualLocalization", "argo");
  v1 = (void *)qword_253E9A290;
  qword_253E9A290 = (uint64_t)v0;

}

@end
