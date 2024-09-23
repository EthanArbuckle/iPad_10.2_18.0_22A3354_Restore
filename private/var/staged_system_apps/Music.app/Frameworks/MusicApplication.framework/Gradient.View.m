@implementation Gradient.View

- (_TtCV11MusicCoreUI8Gradient4View)initWithCoder:(id)a3
{
  _TtCV11MusicCoreUI8Gradient4View *result;

  result = (_TtCV11MusicCoreUI8Gradient4View *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicCoreUI/Gradient.swift", 26, 2, 52, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_4E684(0, (unint64_t *)&qword_15088E0, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCV11MusicCoreUI8Gradient4View)initWithFrame:(CGRect)a3
{
  _TtCV11MusicCoreUI8Gradient4View *result;

  result = (_TtCV11MusicCoreUI8Gradient4View *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.View", 16, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->typedConfiguration[OBJC_IVAR____TtCV11MusicCoreUI8Gradient4View_typedConfiguration];
  v3 = *(_QWORD *)&self->typedConfiguration[OBJC_IVAR____TtCV11MusicCoreUI8Gradient4View_typedConfiguration + 8];
  v4 = *(_QWORD *)&self->typedConfiguration[OBJC_IVAR____TtCV11MusicCoreUI8Gradient4View_typedConfiguration + 16];
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV11MusicCoreUI8Gradient4View_typedConfiguration));
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
}

@end
