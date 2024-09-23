@implementation ImageWithCircleBackground

- (_TtC6Health25ImageWithCircleBackground)initWithCoder:(id)a3
{
  _TtC6Health25ImageWithCircleBackground *result;

  result = (_TtC6Health25ImageWithCircleBackground *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B8850, "Health/ImageWithCircleBackground.swift", 38, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ImageWithCircleBackground();
  v2 = v4.receiver;
  -[ImageWithCircleBackground layoutSubviews](&v4, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v4.receiver, v4.super_class);
  objc_msgSend(v2, "frame");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetWidth(v5) * 0.5);

}

- (_TtC6Health25ImageWithCircleBackground)initWithFrame:(CGRect)a3
{
  _TtC6Health25ImageWithCircleBackground *result;

  result = (_TtC6Health25ImageWithCircleBackground *)_swift_stdlib_reportUnimplementedInitializer("Health.ImageWithCircleBackground", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
