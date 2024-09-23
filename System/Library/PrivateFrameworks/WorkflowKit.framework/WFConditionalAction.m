@implementation WFConditionalAction

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  WFConditionalAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C16ECF44();

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isDeletable
{
  WFConditionalAction *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1C16ED234((uint64_t)v2);

  return v3;
}

- (BOOL)usesLegacyInputBehavior
{
  return 1;
}

- (BOOL)inputRequired
{
  WFConditionalAction *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1C16ED2AC();

  return v3;
}

- (NSArray)inputContentClasses
{
  WFConditionalAction *v2;
  void *v3;

  v2 = self;
  sub_1C16ED328();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1E7470);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  WFConditionalAction *v9;
  char v10;

  v5 = (uint64_t)a3;
  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1C16ED39C(v5, (uint64_t)v8);
  LOBYTE(v5) = v10;

  return v5 & 1;
}

- (id)inputSourceInWorkflow:(id)a3
{
  id v4;
  WFConditionalAction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1C16ED45C((uint64_t)v4);

  return v6;
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  WFConditionalAction *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C16ED550();
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

- (id)createAccompanyingActions
{
  WFConditionalAction *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C16ED6CC((uint64_t)v2);

  if (v3)
  {
    sub_1C15D73A8(0, (unint64_t *)&qword_1EF6FA8D0);
    v4 = (void *)sub_1C1B0F374();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (WFConditionalAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = sub_1C1B0F224();
  v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
    a5 = (id)sub_1C1B0F164();
  }
  v10 = a4;
  return (WFConditionalAction *)WFConditionalAction.init(identifier:definition:serializedParameters:)(v7, v9, a4, (uint64_t)a5);
}

- (id)serializedParameters
{
  WFConditionalAction *v2;
  void *v3;

  v2 = self;
  sub_1C16EDC4C();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6FB380);
  v3 = (void *)sub_1C1B0F14C();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minimumSupportedClientVersion
{
  WFConditionalAction *v2;
  void *v3;

  v2 = self;
  sub_1C16EE1A4();

  v3 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSArray)parameterDefinitions
{
  return (NSArray *)sub_1C16F0E1C(self, (uint64_t)a2, (void (*)(void))sub_1C16EEA78, (unint64_t *)&unk_1EF6FDDB0);
}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  WFConditionalAction *v3;
  void *v4;

  v3 = self;
  sub_1C16EEDAC();

  sub_1C15D73A8(0, (unint64_t *)&qword_1EF6FC4F0);
  v4 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v4;
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  WFConditionalAction *v5;
  char v6;
  char v7;

  sub_1C1B0F224();
  swift_unknownObjectRetain();
  v5 = self;
  sub_1C16EFBDC();
  v7 = v6;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WFConditionalAction *v8;
  id v9;

  v5 = sub_1C1B0F224();
  v7 = v6;
  v8 = self;
  v9 = sub_1C16F08B0(v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)containedVariables
{
  return sub_1C16F0E1C(self, (uint64_t)a2, (void (*)(void))sub_1C16F0CC8, (unint64_t *)&qword_1EF6FCDB0);
}

- (void)visibleParametersUpdated
{
  WFConditionalAction *v2;

  v2 = self;
  sub_1C16F0E84();

}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  WFConditionalAction *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1C16F11CC(a3);
  swift_unknownObjectRelease();

}

- (BOOL)truthWithVariableSource:(id)a3
{
  WFConditionalAction *v5;
  char v6;
  char v7;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1C16F1384(a3);
  v7 = v6;
  swift_unknownObjectRelease();

  return v7 & 1;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  WFConditionalAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C18B1138((uint64_t)&unk_1EF6FEE38, (uint64_t)v7);
}

- (WFConditionalAction)init
{
  WFConditionalAction.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFConditionalAction____lazy_storage___addButtonParameter));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
}

- (BOOL)showsAddButtonForParameter:(id)a3
{
  id v4;
  WFConditionalAction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = WFConditionalAction.showsAddButton(for:)((WFParameter *)v5);

  return self & 1;
}

- (id)parameterStateUpdateForPlusButtonForParameter:(id)a3
{
  id v4;
  WFConditionalAction *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)WFConditionalAction.parameterStateUpdateForPlusButton(for:)((WFParameter *)v5);

  return v6;
}

- (void)variableDidChange:(id)a3
{
  id v4;
  Class isa;
  WFVariable v6;

  v4 = a3;
  v6.super.isa = (Class)self;
  isa = v6.super.isa;
  WFConditionalAction.variableDidChange(_:)(v6);

}

@end
