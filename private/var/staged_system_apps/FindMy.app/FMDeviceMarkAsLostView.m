@implementation FMDeviceMarkAsLostView

- (_TtC6FindMy22FMDeviceMarkAsLostView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10022416C();
}

- (void)handleAction
{
  _TtC6FindMy22FMDeviceMarkAsLostView *v2;

  v2 = self;
  sub_100223DF0();

}

- (void)handleStatusRowTap
{
  _TtC6FindMy22FMDeviceMarkAsLostView *v2;

  v2 = self;
  sub_100223F70();

}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMDeviceMarkAsLostView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMDeviceMarkAsLostView_lostStatusRow));
}

@end
