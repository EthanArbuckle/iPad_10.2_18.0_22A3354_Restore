@implementation CalendarUnitPickerParameter

- (NSArray)possibleStates
{
  _TtC11WorkflowKitP33_AD767BEAA88C93AB9397AB9AE1AC0E0B27CalendarUnitPickerParameter *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C185AA14();

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
  _TtC11WorkflowKitP33_AD767BEAA88C93AB9397AB9AE1AC0E0B27CalendarUnitPickerParameter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C185AB24(v4);
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

- (_TtC11WorkflowKitP33_AD767BEAA88C93AB9397AB9AE1AC0E0B27CalendarUnitPickerParameter)initWithDefinition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1C185AD4C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
