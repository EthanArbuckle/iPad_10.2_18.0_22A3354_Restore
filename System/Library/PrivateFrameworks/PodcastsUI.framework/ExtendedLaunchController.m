@implementation ExtendedLaunchController

- (_TtC10PodcastsUI24ExtendedLaunchController)init
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC10PodcastsUI24ExtendedLaunchController_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2178);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 28) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_BYTE *)(v4 + 24) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExtendedLaunchController();
  return -[ExtendedLaunchController init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
