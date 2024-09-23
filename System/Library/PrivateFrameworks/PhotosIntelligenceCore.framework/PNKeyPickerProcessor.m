@implementation PNKeyPickerProcessor

+ (id)keyPickFromAssets:(id)a3 options:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257337910);
  v5 = sub_244068F60();
  v6 = a4;
  v7 = (void *)static PNKeyPickerProcessor.keyPick(from:options:)(v5, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (PNKeyPickerProcessor)init
{
  return (PNKeyPickerProcessor *)PNKeyPickerProcessor.init()();
}

@end
