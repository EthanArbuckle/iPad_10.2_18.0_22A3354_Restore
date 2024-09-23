@implementation CaptiveAnalyticsSessionPostHSHelperEvent

xpc_object_t __CaptiveAnalyticsSessionPostHSHelperEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  const __CFString *v4;
  const char *CStringPtr;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TotalDuration", **(_QWORD **)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const __CFString **)(v3 + 8);
  if (v4)
  {
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    xpc_dictionary_set_string(v2, "BundleID", CStringPtr);
    v3 = *(_QWORD *)(a1 + 32);
  }
  xpc_dictionary_set_BOOL(v2, "InternetAccess", *(_BYTE *)(v3 + 16) != 0);
  return v2;
}

@end
