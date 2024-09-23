@implementation PlaybackCloseButton

- (_TtC9SeymourUI19PlaybackCloseButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackCloseButton *)sub_22B5CE798(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19PlaybackCloseButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5CEFEC();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI19PlaybackCloseButton *v2;

  v2 = self;
  sub_22B5CECC8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_styleProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackCloseButton_vibrancyView));
}

@end
