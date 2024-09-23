@implementation TUIEmojiUpscalerLog

void __TUIEmojiUpscalerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInputUI", "EmojiUpscaler");
  v1 = (void *)TUIEmojiUpscalerLog_log;
  TUIEmojiUpscalerLog_log = (uint64_t)v0;

}

@end
