@implementation _UVServiceHubServiceFactory

+ (id)makeAgentPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = _Block_copy(a4);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D10));
  v7 = sub_224D69DB8((uint64_t)sub_224D69FA8, v5, &qword_2557D7D18, (uint64_t (*)(uint64_t, uint64_t))sub_224D69264, &qword_2557D7D20);
  swift_release();
  return v7;
}

+ (id)makeShellPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = _Block_copy(a4);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D30));
  v7 = sub_224D69DB8((uint64_t)sub_224D69F48, v5, &qword_2557D7D38, (uint64_t (*)(uint64_t, uint64_t))sub_224D69448, &qword_2557D7D40);
  swift_release();
  return v7;
}

+ (id)makePreviewServiceAndReturnError:(id *)a3
{
  return sub_224D7512C();
}

- (_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[_UVServiceHubServiceFactory init](&v3, sel_init);
}

@end
