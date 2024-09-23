@implementation TTSAssistantAsset

- (NSArray)supportedLanguages
{
  void *v2;

  AssistantAsset.supportedLanguages.getter();
  v2 = (void *)sub_19AE55664();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  return (NSString *)sub_19ADD340C((uint64_t)self, (uint64_t)a2, AssistantAsset.name.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_19ADD340C((uint64_t)self, (uint64_t)a2, AssistantAsset.identifier.getter);
}

- (int64_t)assistantGender
{
  return AssistantAsset.assistantGender.getter();
}

- (int64_t)assistantOrder
{
  return AssistantAsset.assistantOrder.getter();
}

- (BOOL)isCustom
{
  TTSAssistantAsset *v2;
  char v3;

  v2 = self;
  v3 = sub_19ADD3380();

  return v3 & 1;
}

- (NSString)primaryLanguage
{
  return (NSString *)sub_19ADD340C((uint64_t)self, (uint64_t)a2, sub_19ADD3440);
}

- (int64_t)gender
{
  return AssistantAsset.assistantGender.getter();
}

- (NSString)description
{
  TTSAssistantAsset *v2;
  void *v3;

  v2 = self;
  sub_19ADD34F8();

  v3 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TTSAssistantAsset)init
{
  AssistantAsset.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_1();
}

@end
