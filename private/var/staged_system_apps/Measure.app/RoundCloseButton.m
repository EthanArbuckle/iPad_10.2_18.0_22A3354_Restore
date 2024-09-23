@implementation RoundCloseButton

- (_TtC7Measure16RoundCloseButton)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC7Measure16RoundCloseButton *result;

  v5 = OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC7Measure16RoundCloseButton_closeImageView;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7Measure16RoundCloseButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/RoundCloseButton.swift", 30, 2, 40, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[RoundCloseButton layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView];
  objc_msgSend(v3, "frame", v4.receiver, v4.super_class);
  objc_msgSend(v3, "_setCornerRadius:", CGRectGetHeight(v5) * 0.5);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure16RoundCloseButton_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure16RoundCloseButton_closeImageView));
}

@end
