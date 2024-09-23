@implementation PLLogProcessMonitor

void __PLLogProcessMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "processMonitor");
  v1 = (void *)qword_1ED8835D0;
  qword_1ED8835D0 = (uint64_t)v0;

}

@end
