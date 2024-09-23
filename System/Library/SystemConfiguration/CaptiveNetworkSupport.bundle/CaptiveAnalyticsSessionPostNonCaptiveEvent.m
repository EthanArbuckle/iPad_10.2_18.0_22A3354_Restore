@implementation CaptiveAnalyticsSessionPostNonCaptiveEvent

xpc_object_t __CaptiveAnalyticsSessionPostNonCaptiveEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "CaptiveBypass", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "SecurityType", **(unsigned int **)(a1 + 32));
  return v2;
}

@end
