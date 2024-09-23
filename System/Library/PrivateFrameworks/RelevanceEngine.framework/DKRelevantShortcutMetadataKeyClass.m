@implementation DKRelevantShortcutMetadataKeyClass

Class __get_DKRelevantShortcutMetadataKeyClass_block_invoke(uint64_t a1)
{
  Class result;
  float v3;
  float v4;

  CoreDuetLibrary_0();
  result = objc_getClass("_DKRelevantShortcutMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKRelevantShortcutMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_DKRelevantShortcutMetadataKeyClass_block_invoke_cold_1();
    return (Class)RERelevanceEqualToRelevance(v3, v4);
  }
  return result;
}

uint64_t __get_DKRelevantShortcutMetadataKeyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[REDonatedActionFilteredCache _queue_removeDonation:].cold.1(v0);
}

@end
