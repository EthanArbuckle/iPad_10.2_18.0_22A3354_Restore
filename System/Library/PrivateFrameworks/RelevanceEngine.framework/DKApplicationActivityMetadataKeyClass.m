@implementation DKApplicationActivityMetadataKeyClass

void __get_DKApplicationActivityMetadataKeyClass_block_invoke(uint64_t a1)
{
  _RECrossedFeature *v2;
  SEL v3;
  id v4;
  id v5;

  CoreDuetLibrary_1();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_DKApplicationActivityMetadataKey");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationActivityMetadataKeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (_RECrossedFeature *)__get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1();
    -[_RECrossedFeature _replaceDependentFeature:withFeature:](v2, v3, v4, v5);
  }
}

Class __get_DKApplicationActivityMetadataKeyClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  CoreDuetLibrary_2();
  result = objc_getClass("_DKApplicationActivityMetadataKey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_DKApplicationActivityMetadataKeyClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1();
    return (Class)__get_DKIntentMetadataKeyClass_block_invoke_1(v3);
  }
  return result;
}

uint64_t __get_DKApplicationActivityMetadataKeyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[REPipedLocationDonor _locationFromDefaults].cold.1(v0);
}

@end
