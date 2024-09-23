@implementation WFGetAccessibilitySettingAction

- (id)copyWithSerializedParameters:(id)a3
{
  id result;

  sub_1C17DACE0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C1834B78);
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
  _TtC11WorkflowKit31WFGetAccessibilitySettingAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C1834D34();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C1834F90(self, (uint64_t)a2, a3, (void (*)(id))sub_1C1834E90);
}

- (_TtC11WorkflowKit31WFGetAccessibilitySettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7
{
  return (_TtC11WorkflowKit31WFGetAccessibilitySettingAction *)sub_1C1835014((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *))sub_1C1835004);
}

@end
