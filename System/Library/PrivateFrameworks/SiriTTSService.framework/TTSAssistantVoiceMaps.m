@implementation TTSAssistantVoiceMaps

- (NSDictionary)voicesForLanguageMap
{
  return (NSDictionary *)sub_19ADD3660((uint64_t)self, (uint64_t)a2, TTSAsset.AssistantVoiceMaps.voicesForLanguageMap.getter);
}

- (NSDictionary)deprecatedVoicesMap
{
  return (NSDictionary *)sub_19ADD3660((uint64_t)self, (uint64_t)a2, TTSAsset.AssistantVoiceMaps.deprecatedVoicesMap.getter);
}

- (NSDictionary)relativePitchOrderForVoicesMap
{
  return (NSDictionary *)sub_19ADD3708((uint64_t)self, (uint64_t)a2, TTSAsset.AssistantVoiceMaps.relativePitchOrderForVoicesMap.getter);
}

- (NSDictionary)relativeOrderForVoicesMap
{
  return (NSDictionary *)sub_19ADD3708((uint64_t)self, (uint64_t)a2, TTSAsset.AssistantVoiceMaps.relativeOrderForVoicesMap.getter);
}

- (NSDictionary)identifiersForVoicesMap
{
  return (NSDictionary *)sub_19ADD3708((uint64_t)self, (uint64_t)a2, TTSAsset.AssistantVoiceMaps.identifiersForVoicesMap.getter);
}

- (TTSAssistantVoiceMaps)init
{
  TTSAsset.AssistantVoiceMaps.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_6_25();
  OUTLINED_FUNCTION_41_1();
}

@end
