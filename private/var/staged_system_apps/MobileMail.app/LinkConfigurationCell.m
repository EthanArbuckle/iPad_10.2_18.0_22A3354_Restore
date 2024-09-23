@implementation LinkConfigurationCell

- (_TtC10MobileMail21LinkConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail21LinkConfigurationCell *)sub_1002AA4C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail21LinkConfigurationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002AAE20();
}

- (NSString)accessibilityLabel
{
  _TtC10MobileMail21LinkConfigurationCell *v2;
  uint64_t v3;
  NSString v5;
  id v6;
  uint64_t v8;

  v2 = self;
  sub_1002AB0B0();
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
  _TtC10MobileMail21LinkConfigurationCell *v4;
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
  _TtC10MobileMail21LinkConfigurationCell *v2;

  v2 = self;
  sub_1002AB268();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell_linkView));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell____lazy_storage___avatarViewController));
  sub_1002AA328((uint64_t)self + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell_searchItem);
  sub_100221900((uint64_t)self + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell_richLinkMetadataGeneratorDelegate);
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4;
  _TtC10MobileMail21LinkConfigurationCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002ABCCC((uint64_t)a3);

}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  id v4;
  _TtC10MobileMail21LinkConfigurationCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002ABCCC((uint64_t)a3);

}

@end
