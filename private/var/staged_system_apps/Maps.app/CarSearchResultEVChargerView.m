@implementation CarSearchResultEVChargerView

- (UIImageView)leadingIcon
{
  _TtC4Maps28CarSearchResultEVChargerView *v2;
  id v3;

  v2 = self;
  v3 = sub_1000A556C();

  return (UIImageView *)v3;
}

- (void)setLeadingIcon:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps28CarSearchResultEVChargerView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps28CarSearchResultEVChargerView *)sub_1000A58E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps28CarSearchResultEVChargerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A65CC();
}

- (void)resetContents
{
  _TtC4Maps28CarSearchResultEVChargerView *v2;
  id v3;
  NSString v4;
  id v5;
  id v6;

  v2 = self;
  v3 = sub_1000A5734();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setText:", v4);

  v5 = sub_1000A556C();
  objc_msgSend(v5, "setImage:", 0);

  v6 = sub_1000A5674();
  objc_msgSend(v6, "setImage:", 0);

}

- (void)setTextAndIconColor:(id)a3 status:(int)a4
{
  id v6;
  _TtC4Maps28CarSearchResultEVChargerView *v7;

  v6 = a3;
  v7 = self;
  sub_1000A5FB0((uint64_t)v6, a4);

}

- (void)updateContentsWithPlugStatus:(int)a3 displayString:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC4Maps28CarSearchResultEVChargerView *v9;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = self;
  sub_1000A61EC(a3, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)updateLabelColors:(id)a3
{
  id v4;
  _TtC4Maps28CarSearchResultEVChargerView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000A5734();
  objc_msgSend(v6, "setTextColor:", v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->leadingIconString[OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView_leadingIconString]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->leadingIconString[OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView_trailingIconString]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView_horizontal));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___trailingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___chargerInfoLabel));
}

@end
