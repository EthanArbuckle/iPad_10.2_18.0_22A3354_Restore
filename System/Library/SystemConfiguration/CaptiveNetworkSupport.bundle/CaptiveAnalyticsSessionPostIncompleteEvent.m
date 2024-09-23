@implementation CaptiveAnalyticsSessionPostIncompleteEvent

xpc_object_t __CaptiveAnalyticsSessionPostIncompleteEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Reason", *(unsigned int *)(a1 + 32));
  return v2;
}

@end
