@implementation CaptiveAnalyticsSessionPostBuiltinEvent

xpc_object_t __CaptiveAnalyticsSessionPostBuiltinEvent_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TotalDuration", **(_QWORD **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "DetectionType", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "AutoLoginUsed", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) != 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    xpc_dictionary_set_uint64(v2, "MaintenanceInterval", v4);
    xpc_dictionary_set_uint64(v2, "CorrectPassiveDetections", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    xpc_dictionary_set_uint64(v2, "IncorrectPassiveDetections", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v3 = *(_QWORD *)(a1 + 32);
  }
  xpc_dictionary_set_uint64(v2, "SecurityType", *(unsigned int *)(v3 + 48));
  return v2;
}

@end
