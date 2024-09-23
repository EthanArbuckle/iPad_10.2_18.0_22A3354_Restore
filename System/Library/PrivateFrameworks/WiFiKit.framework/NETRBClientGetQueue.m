@implementation NETRBClientGetQueue

dispatch_queue_t ____NETRBClientGetQueue_block_invoke()
{
  dispatch_queue_t result;
  int *v1;
  char __str[45];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x2DuLL, "com.apple.framework.netrb.%p", &__netrbClientTypeID);
  __str[44] = 0;
  result = dispatch_queue_create(__str, 0);
  __NETRBClientGetQueue___netrbQueue = (uint64_t)result;
  if (!result)
  {
    v1 = __error();
    strerror(*v1);
    return (dispatch_queue_t)NETRBErrorLog();
  }
  return result;
}

@end
