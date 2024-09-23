@implementation SettingPickerParameter

- (BOOL)preferParameterValuePicker
{
  _TtC11WorkflowKit22SettingPickerParameter *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1C17DB418();

  return v3;
}

- (NSArray)possibleStates
{
  _TtC11WorkflowKit22SettingPickerParameter *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1C17DB4D8();
  v4 = v3;

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6FDD90);
    v5 = (void *)sub_1C1B0F374();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return sub_1C17DB620((uint64_t)self, (uint64_t)a2, a3);
}

- (_TtC11WorkflowKit22SettingPickerParameter)initWithDefinition:(id)a3
{
  _TtC11WorkflowKit22SettingPickerParameter *result;

  sub_1C17DB678((uint64_t)a3);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1606884((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit22SettingPickerParameter_datasource);
  OUTLINED_FUNCTION_11();
}

@end
