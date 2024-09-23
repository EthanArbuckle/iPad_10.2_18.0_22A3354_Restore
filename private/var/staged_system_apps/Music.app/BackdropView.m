@implementation BackdropView

- (_TtC5Music12BackdropView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5Music12BackdropView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music12BackdropView_gradientMaskType) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Music12BackdropView_gradientLayer) = 0;
  v5 = OBJC_IVAR____TtC5Music12BackdropView_overlayView;
  type metadata accessor for PassthroughView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC5Music12BackdropView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/BackdropView.swift", 24, 2, 66, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_10004A07C(0, &qword_1011B47E8, CABackdropLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  _TtC5Music12BackdropView *v2;

  v2 = self;
  sub_10044CB38();

}

- (_TtC5Music12BackdropView)initWithFrame:(CGRect)a3
{
  _TtC5Music12BackdropView *result;

  result = (_TtC5Music12BackdropView *)_swift_stdlib_reportUnimplementedInitializer("Music.BackdropView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
