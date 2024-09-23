@implementation PKAddressFieldPickerViewHosting

+ (id)loadViewControllerWithAllowedValues:(id)a3 selectedValue:(id)a4 isValid:(BOOL)a5 onCommit:(id)a6
{
  void *v7;
  id v8;

  v7 = _Block_copy(a6);
  sub_19D7497C4();
  sub_19DE87E10();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B3CA8));
  v8 = a4;
  return (id)sub_19DE864D8();
}

- (_TtC9PassKitUI31PKAddressFieldPickerViewHosting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PKAddressFieldPickerViewHosting();
  return -[PKAddressFieldPickerViewHosting init](&v3, sel_init);
}

@end
