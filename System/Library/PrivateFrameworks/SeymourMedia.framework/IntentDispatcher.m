@implementation IntentDispatcher

- (_TtC12SeymourMedia16IntentDispatcher)init
{
  _TtC12SeymourMedia16IntentDispatcher *v3;
  void *v4;
  objc_super v6;
  __int128 v7;

  sub_21A0EE7B4();
  v3 = self;
  v4 = (void *)sub_21A1AA138();
  _s11SeymourCore12DependenciesC0A5MediaE8standard5queueACSo012OS_dispatch_F0C_tFZ_0(v4);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550C3698);
  sub_21A1A8278();
  swift_release();
  sub_21A0D9560(&v7, (uint64_t)v3 + OBJC_IVAR____TtC12SeymourMedia16IntentDispatcher_sessionClient);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for IntentDispatcher();
  return -[IntentDispatcher init](&v6, sel_init);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia16IntentDispatcher_sessionClient);
}

- (id)handlerForIntent:(id)a3
{
  id v4;
  _TtC12SeymourMedia16IntentDispatcher *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = a3;
  v5 = self;
  IntentDispatcher.handler(for:)(v4, (uint64_t)v13);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)sub_21A1AA510();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v11;
}

@end
