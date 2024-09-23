@implementation FMDeviceNotificationsView

- (_TtC6FindMy25FMDeviceNotificationsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F31B8();
}

- (void)setupSubviews
{
  _TtC6FindMy25FMDeviceNotificationsView *v2;

  v2 = self;
  sub_1001F12E4();

}

- (void)notifyWhenDetachedRowTap
{
  _TtC6FindMy25FMDeviceNotificationsView *v2;

  v2 = self;
  sub_1001F2E1C();

}

- (void)notifyWhenLeftBehindRowTap
{
  _TtC6FindMy25FMDeviceNotificationsView *v2;

  v2 = self;
  sub_1001F2F50();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenFoundSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenDetachedSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_notifyWhenLeftBehindSwitch));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMDeviceNotificationsView_delegate);
}

@end
