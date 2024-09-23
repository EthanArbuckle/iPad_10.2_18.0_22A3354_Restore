@implementation FMGradientMaskingView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100006C5C(0, &qword_1005DC478, CAGradientLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC6FindMy21FMGradientMaskingView)init
{
  return (_TtC6FindMy21FMGradientMaskingView *)sub_100234540();
}

- (_TtC6FindMy21FMGradientMaskingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy21FMGradientMaskingView *result;

  v5 = OBJC_IVAR____TtC6FindMy21FMGradientMaskingView_gradientLayer;
  v6 = objc_allocWithZone((Class)CAGradientLayer);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy21FMGradientMaskingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMGradientMaskingView.swift", 34, 2, 25, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy21FMGradientMaskingView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy21FMGradientMaskingView *result;

  result = (_TtC6FindMy21FMGradientMaskingView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMGradientMaskingView", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMGradientMaskingView_gradientLayer));
}

@end
