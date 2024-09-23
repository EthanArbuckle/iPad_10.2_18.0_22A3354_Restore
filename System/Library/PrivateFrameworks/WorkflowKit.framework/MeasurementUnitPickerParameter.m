@implementation MeasurementUnitPickerParameter

- (NSArray)possibleStates
{
  _TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1C1818DF0();

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
  _TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1C1818F4C(v4);
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

- (_TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter)initWithDefinition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1C18190E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter_unitType));
}

@end
