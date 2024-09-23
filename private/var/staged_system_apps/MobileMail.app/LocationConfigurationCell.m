@implementation LocationConfigurationCell

- (_TtC10MobileMail25LocationConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail25LocationConfigurationCell *)sub_1002ACF10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail25LocationConfigurationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002ADEF4();
}

- (NSString)accessibilityLabel
{
  _TtC10MobileMail25LocationConfigurationCell *v2;
  uint64_t v3;
  NSString v5;
  id v6;
  uint64_t v8;

  v2 = self;
  sub_1002AE1EC();
  v8 = v3;

  if (v8)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v3;
  _TtC10MobileMail25LocationConfigurationCell *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v5;

    v8 = v6;
    v9 = v7;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  sub_100233B28(v8, v9);

}

- (void)layoutSubviews
{
  _TtC10MobileMail25LocationConfigurationCell *v2;

  v2 = self;
  sub_1002AE570();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_mapImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_dateLabel));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell____lazy_storage___avatarViewController));
  sub_1002ACDD8((uint64_t)self + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_searchItem);
}

@end
