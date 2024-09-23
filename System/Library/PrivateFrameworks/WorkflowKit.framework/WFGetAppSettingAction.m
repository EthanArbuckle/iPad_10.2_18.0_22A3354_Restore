@implementation WFGetAppSettingAction

- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7
{
  return (_TtC11WorkflowKit21WFGetAppSettingAction *)sub_1C1835014((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *))sub_1C1831604);
}

- (id)copyWithSerializedParameters:(id)a3
{
  id result;

  sub_1C17DACE0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1C1831718);
  return result;
}

- (NSArray)disabledOnPlatforms
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  void *v3;

  v2 = self;
  sub_1C18318B0();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (INAppDescriptor)displayableAppDescriptor
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  id v3;

  v2 = self;
  v3 = sub_1C1831D00((uint64_t)v2);

  return (INAppDescriptor *)v3;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4;
  _TtC11WorkflowKit21WFGetAppSettingAction *v5;

  v4 = a3;
  v5 = self;
  sub_1C1831EB4();

}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  _TtC11WorkflowKit21WFGetAppSettingAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C18B1138((uint64_t)&unk_1EF700FD0, (uint64_t)v7);
}

- (NSArray)parameterDefinitions
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  void *v3;

  v2 = self;
  sub_1C1832CC8();

  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FDDB0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSDictionary)outputDictionary
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  void *v3;

  v2 = self;
  sub_1C1832F80();

  v3 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)configureParameter:(id)a3
{
  sub_1C1833154();
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C1834F90(self, (uint64_t)a2, a3, (void (*)(id))sub_1C18331D8);
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  return sub_1C1834F90(self, (uint64_t)a2, a3, (void (*)(id))sub_1C18332D0);
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit21WFGetAppSettingAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C18333D0();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C1834F90(self, (uint64_t)a2, a3, (void (*)(id))sub_1C17D924C);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit21WFGetAppSettingAction *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C1833790();
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1C1B0F1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit21WFGetAppSettingAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C1833A00(v4);

  v6 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v6;
}

- (WFActionParameterSummary)parameterSummary
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1C1833FB4();
  v4 = v3;

  return (WFActionParameterSummary *)v4;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v4;

  v4 = self;
  LOBYTE(a3) = sub_1C18340B8(a3);

  return a3 & 1;
}

- (id)backingActionIdentifiers
{
  _TtC11WorkflowKit21WFGetAppSettingAction *v2;
  void *v3;

  v2 = self;
  sub_1C18341A8();

  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)entityMetadataForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11WorkflowKit21WFGetAppSettingAction *v7;
  void *v8;
  void *v9;

  v4 = sub_1C1B0F224();
  v6 = v5;
  v7 = self;
  sub_1C1834268(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v7;

  sub_1C1B0F224();
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    sub_1C1B0F164();
  }
  v7 = a4;
  WFGetAppSettingAction.init(identifier:definition:serializedParameters:)();
}

- (_TtC11WorkflowKit21WFGetAppSettingAction)init
{
  WFGetAppSettingAction.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit21WFGetAppSettingAction_fullyQualifiedActionIdentifier));
  swift_bridgeObjectRelease();
}

@end
