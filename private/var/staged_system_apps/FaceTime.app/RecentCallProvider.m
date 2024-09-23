@implementation RecentCallProvider

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  id v5;
  _TtC8FaceTime18RecentCallProvider *v6;

  v5 = a3;
  v6 = self;
  sub_1000062C8();

}

- (_TtC8FaceTime18RecentCallProvider)init
{
  _TtC8FaceTime18RecentCallProvider *result;

  result = (_TtC8FaceTime18RecentCallProvider *)_swift_stdlib_reportUnimplementedInitializer("FaceTime.RecentCallProvider", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001287C((uint64_t)self + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate, (uint64_t *)&unk_1000A2BA0);
  sub_10000A730(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield]);

}

@end
