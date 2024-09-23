@implementation ByteCountUnitPickerParameter

- (NSArray)possibleStates
{
  _TtC11WorkflowKitP33_C118BE33EF53EB9729403A300E2F244728ByteCountUnitPickerParameter *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C181FF98();

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
  _TtC11WorkflowKitP33_C118BE33EF53EB9729403A300E2F244728ByteCountUnitPickerParameter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C18200B0(v4);
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

- (_TtC11WorkflowKitP33_C118BE33EF53EB9729403A300E2F244728ByteCountUnitPickerParameter)initWithDefinition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1C1820210();
}

@end
