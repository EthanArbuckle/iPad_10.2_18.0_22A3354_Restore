@implementation MISDGetQueue

dispatch_queue_t ____MISDGetQueue_block_invoke()
{
  dispatch_queue_t result;
  char __str[34];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x22uLL, "com.apple.misd.%p", &__MISDGetQueue___misdQueue);
  __str[33] = 0;
  result = dispatch_queue_create(__str, 0);
  __MISDGetQueue___misdQueue = (uint64_t)result;
  return result;
}

@end
