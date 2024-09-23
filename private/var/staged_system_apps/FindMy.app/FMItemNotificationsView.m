@implementation FMItemNotificationsView

- (_TtC6FindMy23FMItemNotificationsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100355798();
}

- (void)setupSubviews
{
  _TtC6FindMy23FMItemNotificationsView *v2;

  v2 = self;
  sub_100354400();

}

- (void)notifyWhenLeftBehindRowTap
{
  _TtC6FindMy23FMItemNotificationsView *v2;

  v2 = self;
  sub_100355530();

}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_notifyWhenFoundSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMItemNotificationsView_notifyWhenLeftBehindSwitch));
}

@end
