@implementation _UISceneKeyValueStorageExtension

+ (id)settingsExtensions
{
  uint64_t v0;
  void *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75B18);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1866691E0;
  objc_msgSend((id)objc_opt_self(), sel_extensionForProtocol_, &unk_1EE0CDD38);
  *(_QWORD *)(v0 + 32) = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75AE8);
  v1 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  return v1;
}

+ (id)hostComponents
{
  uint64_t v0;
  void *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75B18);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1866691E0;
  *(_QWORD *)(v0 + 32) = type metadata accessor for _UISceneKeyValueStorageComponent();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECD75AE8);
  v1 = (void *)sub_18650763C();
  swift_bridgeObjectRelease();
  return v1;
}

- (_UISceneKeyValueStorageExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISceneKeyValueStorageExtension;
  return -[_UISceneKeyValueStorageExtension init](&v3, sel_init);
}

@end
