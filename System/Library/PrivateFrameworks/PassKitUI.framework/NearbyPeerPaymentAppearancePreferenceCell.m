@implementation NearbyPeerPaymentAppearancePreferenceCell

- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_19DE87BF4();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell *)NearbyPeerPaymentAppearancePreferenceCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D7B57D8();
}

- (void)layoutSubviews
{
  _TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell *v2;

  v2 = self;
  sub_19D7B4760();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_19D7B4C44(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)prepareForReuse
{
  _TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell *v2;

  v2 = self;
  sub_19D7B5338();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_enabledImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_profileImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_nameSettingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_nameLabel));
}

@end
