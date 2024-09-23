@implementation CoreAnimationPackageView

- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002E53B8();
}

- (void)layoutSubviews
{
  _TtC11MusicCoreUI24CoreAnimationPackageView *v2;

  v2 = self;
  CoreAnimationPackageView.layoutSubviews()();

}

- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI24CoreAnimationPackageView *result;

  result = (_TtC11MusicCoreUI24CoreAnimationPackageView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.CoreAnimationPackageView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&self->definition[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_definition];
  v4 = *(void **)&self->definition[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_definition + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->definition[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_definition
                                                       + 64]);

  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(_QWORD *)&self->definition[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateAnimationTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_currentStates));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateController));
}

@end
