@implementation WFTargetedEntityUpdaterAction

- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadata:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v14 = sub_1C1B0F224();
  v16 = v15;
  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FCE70);
  v17 = sub_1C1B0F164();
  if (a8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    a8 = (id)sub_1C1B0F164();
  }
  return (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction *)WFTargetedEntityUpdaterAction.init(identifier:actionMetadata:entityMetadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)(v14, v16, a4, (uint64_t)a5, v17, a7, (uint64_t)a8, a9, a10);
}

- (id)copyWithSerializedParameters:(id)a3
{
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    sub_1C1B0F164();
  }
  v4 = self;
  v5 = sub_1C163B0A0();

  swift_bridgeObjectRelease();
  return v5;
}

- (NSArray)parameterDefinitions
{
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v2;
  void *v3;

  v2 = self;
  sub_1C163B384();

  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FDDB0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C163B9B8();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C163C648(self, (uint64_t)a2, a3, (void (*)(id))sub_1C163BDD0);
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C163C648(self, (uint64_t)a2, a3, (void (*)(id))sub_1C163C388);
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C163C648(self, (uint64_t)a2, a3, (void (*)(id))sub_1C163C4CC);
}

- (BOOL)visibleForUse:(int64_t)a3
{
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v4;

  v4 = self;
  LOBYTE(a3) = sub_1C163C6C0(a3);

  return a3 & 1;
}

- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
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
  WFTargetedEntityUpdaterAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit29WFTargetedEntityUpdaterAction__entityMetadata));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
