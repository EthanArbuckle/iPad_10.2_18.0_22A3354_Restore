@implementation PLLogPLIOReportAgentIOReportStats

void __PLLogPLIOReportAgentIOReportStats_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "PLIOReportAgentIOReportStats");
  v1 = (void *)qword_1ED882420;
  qword_1ED882420 = (uint64_t)v0;

}

@end
