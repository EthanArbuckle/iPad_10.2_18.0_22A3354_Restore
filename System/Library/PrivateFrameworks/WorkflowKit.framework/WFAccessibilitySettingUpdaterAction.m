@implementation WFAccessibilitySettingUpdaterAction

- (id)copyWithSerializedParameters:(id)a3
{
  id result;

  sub_1C17DACE0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C17DAB68);
  return result;
}

- (NSString)iconSymbolName
{
  void *v2;

  v2 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)iconBackgroundColorName
{
  void *v2;

  v2 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C17DADE0();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C17DB044((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  return (_TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction *)sub_1C17DB0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *, uint64_t, void *, void *))WFAccessibilitySettingUpdaterAction.init(identifier:actionMetadata:entityMetadataForParameterIdentifier:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:));
}

@end
