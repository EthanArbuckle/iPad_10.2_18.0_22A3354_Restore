@implementation SportsFavoriteServiceObjC

+ (void)markCacheTopicDirty:(unint64_t)a3
{
  sub_247D298A0(a3);
}

- (SportsFavoriteServiceObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SportsFavoriteServiceObjC;
  return -[SportsFavoriteServiceObjC init](&v3, sel_init);
}

+ (uint64_t)accountDidChange
{
  uint64_t v0;
  id v1;

  if (qword_254456C58 != -1)
    swift_once();
  sub_247D98ECC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254457820);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247D99ED0;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254457930);
  *(_QWORD *)(v0 + 64) = sub_247D0CA84();
  *(_QWORD *)(v0 + 32) = &unk_251955000;
  sub_247D98B60();
  swift_bridgeObjectRelease();
  if (qword_254456C10 != -1)
    swift_once();
  v1 = (id)qword_254456BF8;
  swift_bridgeObjectRetain();
  sub_247D79C10();
  swift_bridgeObjectRelease();

  if (qword_254456B90 != -1)
    swift_once();
  return sub_247D8330C();
}

@end
