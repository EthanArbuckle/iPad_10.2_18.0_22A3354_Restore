@implementation WFEntityUpdatingAction

+ (NSString)entityParameterName
{
  void *v2;

  v2 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v13 = sub_1C1B0F224();
  v15 = v14;
  sub_1C15B882C(0, (unint64_t *)&unk_1EF6FCE70);
  v16 = sub_1C1B0F164();
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    a7 = (id)sub_1C1B0F164();
  }
  return (_TtC11WorkflowKit22WFEntityUpdatingAction *)WFEntityUpdatingAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)(v13, v15, a4, v16, a6, (uint64_t)a7, a8, a9);
}

- (id)copyWithSerializedParameters:(id)a3
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    sub_1C1B0F164();
  }
  v4 = self;
  v5 = sub_1C18B4990();

  swift_bridgeObjectRelease();
  return v5;
}

- (INAppDescriptor)displayableAppDescriptor
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1C18B4BCC();
  v4 = v3;

  return (INAppDescriptor *)v4;
}

- (NSArray)disabledOnPlatforms
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v2;
  void *v3;

  v2 = self;
  sub_1C18B4CA0();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C18B4D80();
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
  _TtC11WorkflowKit22WFEntityUpdatingAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C18B4F40();

  v6 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v6;
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (id)serializedParameters
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v2;
  void *v3;

  v2 = self;
  sub_1C18B52E0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
  v3 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)configureParameter:(id)a3
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1C18B5454((uint64_t)v5);

}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  _BOOL8 v3;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v4;
  void *v5;

  v3 = a3;
  v4 = self;
  sub_1C18B5804(v3);

  sub_1C15B882C(0, (unint64_t *)&qword_1EF6FC4F0);
  v5 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)parameterStateForKey:(id)a3
{
  _TtC11WorkflowKit22WFEntityUpdatingAction *v4;
  id v5;

  sub_1C1B0F224();
  v4 = self;
  v5 = sub_1C18B5E20();
  swift_bridgeObjectRelease();

  return v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v9;

  v6 = sub_1C1B0F224();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C18B6070((unint64_t)a3, (void *)v6, v8);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return v6 & 1;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C18B1138((uint64_t)&unk_1EF702680, (uint64_t)v7);
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v5;

  v5 = self;
  v4 = a3;
  sub_1C18B7F30(a3);

}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v12;

  v10 = _Block_copy(a6);
  if (a4)
    a4 = (id)sub_1C1B0F164();
  _Block_copy(v10);
  v11 = a3;
  v12 = self;
  sub_1C18B7FDC(v11, a4, a5, v12, (void (**)(_QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (id)backingActionIdentifiers
{
  return sub_1C18B8BB8(self, (uint64_t)a2, sub_1C18B8658);
}

- (BOOL)showsAddButtonForParameter:(id)a3
{
  id v4;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1C18B2490((uint64_t)v5);

  return self & 1;
}

- (id)parameterStateUpdateForPlusButtonForParameter:(id)a3
{
  id v4;
  _TtC11WorkflowKit22WFEntityUpdatingAction *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1C18B2618();
  v7 = v6;

  return v7;
}

- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;

  sub_1C1B0F224();
  if (a6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    sub_1C1B0F164();
  }
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  WFEntityUpdatingAction.init(identifier:metadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_134_5(OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction_preprocessedEntity);
  OUTLINED_FUNCTION_134_5(OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___addButtonParameter);
  OUTLINED_FUNCTION_134_5(OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___tableParameter);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___batchExecutor));
}

- (NSArray)availableSubjectValues
{
  return (NSArray *)sub_1C18B8BB8(self, (uint64_t)a2, (void (*)(void))WFEntityUpdatingAction.availableSubjectValues.getter);
}

@end
