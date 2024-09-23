@implementation FMSymbolBulletedListItemView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_titleLabel), "firstBaselineAnchor");
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_subtitleLabel), "lastBaselineAnchor");
}

- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10022E1BC();
}

- (_TtC6FindMy28FMSymbolBulletedListItemView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy28FMSymbolBulletedListItemView *result;

  result = (_TtC6FindMy28FMSymbolBulletedListItemView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSymbolBulletedListItemView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_imageViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMSymbolBulletedListItemView_verticalStackView));
}

@end
