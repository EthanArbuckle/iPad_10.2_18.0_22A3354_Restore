@implementation PHABiomeUtilities

+ (id)readUUIDsWithStream:(int64_t)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = sub_1CAD049C0(a3);

  return v7;
}

+ (id)readBiomeEventsForPhotoStyleWithInputName:(id)a3 labelName:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = sub_1CADC38E4();
  v7 = v6;
  v8 = sub_1CADC38E4();
  sub_1CAD05968(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981E38);
  v10 = (void *)sub_1CADC39BC();
  swift_bridgeObjectRelease();
  return v10;
}

+ (int64_t)biomeStreamFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;

  v3 = sub_1CADC38E4();
  v5 = _s13PhotoAnalysis14BiomeUtilitiesC11biomeStream3forAA0cF0OSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (PHABiomeUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BiomeUtilities();
  return -[PHABiomeUtilities init](&v3, sel_init);
}

@end
