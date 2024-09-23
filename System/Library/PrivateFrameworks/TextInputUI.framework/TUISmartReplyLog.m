@implementation TUISmartReplyLog

void __TUISmartReplyLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInputUI", "SmartReply");
  v1 = (void *)TUISmartReplyLog_log;
  TUISmartReplyLog_log = (uint64_t)v0;

}

@end
