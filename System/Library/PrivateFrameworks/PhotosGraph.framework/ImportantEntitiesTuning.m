@implementation ImportantEntitiesTuning

+ (BOOL)evaluateChildrenAndPetsInferenceAcrossParametersInGraph:(id)a3 photoLibrary:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v8;
  _QWORD *v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_1CA2FB7B4((uint64_t)v8, v9, (uint64_t)v10);

  return 1;
}

- (_TtC11PhotosGraph23ImportantEntitiesTuning)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImportantEntitiesTuning();
  return -[ImportantEntitiesTuning init](&v3, sel_init);
}

@end
