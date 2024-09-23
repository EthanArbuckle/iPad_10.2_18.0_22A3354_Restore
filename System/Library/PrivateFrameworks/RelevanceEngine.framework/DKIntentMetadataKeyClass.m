@implementation DKIntentMetadataKeyClass

Class __get_DKIntentMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKIntentMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKIntentMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKIntentMetadataKeyClass_block_invoke_cold_1();
    return (Class)__get_DKRelevantShortcutMetadataKeyClass_block_invoke(v3);
  }
  return result;
}

Class __get_DKIntentMetadataKeyClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_1();
  result = objc_getClass("_DKIntentMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKIntentMetadataKeyClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKIntentMetadataKeyClass_block_invoke_cold_1();
    return (Class)__get_DKApplicationActivityMetadataKeyClass_block_invoke(v3);
  }
  return result;
}

void __get_DKIntentMetadataKeyClass_block_invoke_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  CoreDuetLibrary_2();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DKIntentMetadataKey");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKIntentMetadataKeyClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__get_DKIntentMetadataKeyClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_1_4(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t __get_DKIntentMetadataKeyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_DKRelevantShortcutMetadataKeyClass_block_invoke_cold_1(v0);
}

@end
