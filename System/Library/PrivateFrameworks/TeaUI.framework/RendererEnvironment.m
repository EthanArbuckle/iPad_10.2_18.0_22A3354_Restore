@implementation RendererEnvironment

- (void)didStartLiveResizing:(id)a3
{
  sub_1B15FBF38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B15FBEAC);
}

- (void)didEndLiveResizing:(id)a3
{
  sub_1B15FBF38((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1B15FBEF4);
}

- (_TtC5TeaUI19RendererEnvironment)init
{
  RendererEnvironment.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
}

@end
