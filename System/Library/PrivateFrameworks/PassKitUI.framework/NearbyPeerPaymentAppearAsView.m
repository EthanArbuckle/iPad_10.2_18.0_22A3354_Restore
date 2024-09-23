@implementation NearbyPeerPaymentAppearAsView

- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D40D230();
}

- (void)layoutSubviews
{
  _TtC9PassKitUI29NearbyPeerPaymentAppearAsView *v2;

  v2 = self;
  sub_19D40C6B0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC9PassKitUI29NearbyPeerPaymentAppearAsView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_19D40CC48(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI29NearbyPeerPaymentAppearAsView *result;

  result = (_TtC9PassKitUI29NearbyPeerPaymentAppearAsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_avatarController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_appearAsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentAppearAsView_nameLabel));
}

@end
