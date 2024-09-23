@implementation MailRecategorizationCellHeaderView

- (NSString)title
{
  _TtC10MobileMail34MailRecategorizationCellHeaderView *v2;
  uint64_t v3;
  NSString v5;
  id v6;
  uint64_t v8;

  v2 = self;
  MailRecategorizationCellHeaderView.title.getter();
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

- (void)setTitle:(id)a3
{
  id v3;
  _TtC10MobileMail34MailRecategorizationCellHeaderView *v4;
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
  MailRecategorizationCellHeaderView.title.setter(v8, v9);

}

- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail34MailRecategorizationCellHeaderView *)sub_1002E75BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail34MailRecategorizationCellHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002E7A70();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail34MailRecategorizationCellHeaderView_titleLabel));
}

@end
