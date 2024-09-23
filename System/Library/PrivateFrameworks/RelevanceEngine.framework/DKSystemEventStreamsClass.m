@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary();
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKSystemEventStreamsClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_0_1(v3);
  }
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKSystemEventStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
    return (Class)__get_DKPredictionTimelineClass_block_invoke(v3);
  }
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_1(uint64_t a1)
{
  CoreDuetLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DKSystemEventStreams");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKSystemEventStreamsClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
    CoreDuetLibrary_1();
  }
}

uint64_t __get_DKSystemEventStreamsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REHTTPDebugCoordinator generateDiagnosticsForPaths:completion:].cold.1(v0);
}

uint64_t __get_DKSystemEventStreamsClass_block_invoke_cold_1_0()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_DKPredictionTimelineClass_block_invoke_cold_1(v0);
}

@end
