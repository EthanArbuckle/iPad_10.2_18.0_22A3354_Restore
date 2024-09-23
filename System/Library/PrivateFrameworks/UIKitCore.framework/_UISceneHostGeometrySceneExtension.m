@implementation _UISceneHostGeometrySceneExtension

+ (id)hostComponents
{
  uint64_t v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75B18);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1866691E0;
  *(_QWORD *)(v2 + 32) = type metadata accessor for _UISceneHostGeometryHostComponent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75AE8);
  v3 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  return v3;
}

- (_UISceneHostGeometrySceneExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISceneHostGeometrySceneExtension;
  return -[_UISceneHostGeometrySceneExtension init](&v3, sel_init);
}

@end
