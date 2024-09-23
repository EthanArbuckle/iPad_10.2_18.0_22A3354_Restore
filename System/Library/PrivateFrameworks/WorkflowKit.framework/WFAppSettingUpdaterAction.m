@implementation WFAppSettingUpdaterAction

- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  return (_TtC11WorkflowKit25WFAppSettingUpdaterAction *)sub_1C17DB0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *, uint64_t, void *, void *))WFAppSettingUpdaterAction.init(identifier:actionMetadata:entityMetadataForParameterIdentifier:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:));
}

- (id)copyWithSerializedParameters:(id)a3
{
  id result;

  sub_1C17DACE0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C17D85E4);
  return result;
}

- (NSDictionary)outputDictionary
{
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v2;
  void *v3;

  v2 = self;
  sub_1C17D8B8C();

  v3 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (INAppDescriptor)displayableAppDescriptor
{
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1C17D8DA8();
  v4 = v3;

  return (INAppDescriptor *)v4;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C17DB044((uint64_t)self, (uint64_t)a2, a3);
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  return sub_1C17DB044((uint64_t)self, (uint64_t)a2, a3);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C17DB620((uint64_t)self, (uint64_t)a2, a3);
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C17DB044((uint64_t)self, (uint64_t)a2, a3);
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C17D934C();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4;
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v5;

  v4 = a3;
  v5 = self;
  sub_1C17D9740();

}

- (NSArray)parameterDefinitions
{
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v2;
  void *v3;

  v2 = self;
  sub_1C17D9928();

  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FDDB0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)configureParameter:(id)a3
{
  id v4;
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v5;

  v4 = a3;
  v5 = self;
  sub_1C17DA144((uint64_t)v4);

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v9;

  v6 = sub_1C1B0F224();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C17DA204((uint64_t)a3, v6, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v4;

  v4 = self;
  LOBYTE(a3) = sub_1C17DA5D4(a3);

  return a3 & 1;
}

- (NSArray)availableSubjectValues
{
  _TtC11WorkflowKit25WFAppSettingUpdaterAction *v2;
  void *v3;

  v2 = self;
  sub_1C17DA944();

  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;

  sub_1C1B0F224();
  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FCE70);
  sub_1C1B0F164();
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    sub_1C1B0F164();
  }
  v13 = a4;
  v14 = a6;
  v15 = a8;
  v16 = a9;
  WFAppSettingUpdaterAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
}

@end
