@implementation BackdropView

- (_TtC16MusicApplication12BackdropView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication12BackdropView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12BackdropView_gradientMaskType) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12BackdropView_gradientLayer) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication12BackdropView_overlayView;
  type metadata accessor for PassthroughView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MusicApplication12BackdropView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/BackdropView.swift", 35, 2, 66, 0);
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  sub_4E684(0, &qword_14E8930, CABackdropLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication12BackdropView *v2;

  v2 = self;
  sub_8E9568();

}

- (_TtC16MusicApplication12BackdropView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication12BackdropView *result;

  result = (_TtC16MusicApplication12BackdropView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.BackdropView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12BackdropView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12BackdropView_overlayView));
}

@end
