@implementation FMMeNotificationView

- (_TtC6FindMy20FMMeNotificationView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC6FindMy20FMMeNotificationView *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  v6 = OBJC_IVAR____TtC6FindMy20FMMeNotificationView_allowFriendRequestSwitch;
  v7 = objc_allocWithZone((Class)type metadata accessor for FMSettingSwitchView());
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, "init");

  result = (_TtC6FindMy20FMMeNotificationView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMMeNotificationView.swift", 33, 2, 39, 0);
  __break(1u);
  return result;
}

- (void)setupSubviews
{
  _TtC6FindMy20FMMeNotificationView *v2;

  v2 = self;
  sub_100283A20();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_mediator));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMeNotificationView_allowFriendRequestSwitch));
}

@end
