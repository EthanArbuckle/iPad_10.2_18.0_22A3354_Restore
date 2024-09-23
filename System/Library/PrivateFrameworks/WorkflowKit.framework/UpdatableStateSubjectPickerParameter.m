@implementation UpdatableStateSubjectPickerParameter

- (NSArray)possibleStates
{
  _TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C181C8EC();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6FDD90);
    v4 = (void *)sub_1C1B0F374();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  _TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C181CBF4(v4);
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

- (BOOL)preferParameterValuePicker
{
  _TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1C181CE54();

  return v3;
}

- (_TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter)initWithDefinition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1C181CEB8();
}

- (void).cxx_destruct
{
  sub_1C1605ED4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter_updatableState), *(_QWORD *)(&self->super.super._hidden+ OBJC_IVAR____TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter_updatableState), *(_QWORD *)(&self->super.super._fixedSizeArray+ OBJC_IVAR____TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter_updatableState), *(void **)((char *)&self->super.super._supportedVariableTypes+ OBJC_IVAR____TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter_updatableState));
}

@end
