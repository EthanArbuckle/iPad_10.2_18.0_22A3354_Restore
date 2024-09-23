@implementation WALogWorkReportHandle

void __WALogWorkReportHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.wifi.analytics", "WorkReport");
  v1 = (void *)qword_253D3A490;
  qword_253D3A490 = (uint64_t)v0;

}

@end
