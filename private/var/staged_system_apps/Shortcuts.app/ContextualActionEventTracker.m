@implementation ContextualActionEventTracker

- (void)dealloc
{
  _TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker *v2;

  v2 = self;
  sub_100065200();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker_event));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker_invalidator));
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker *v8;

  v5 = sub_100003B2C(0, &qword_1000D3120, BKSMousePointerDevice_ptr);
  v6 = sub_100068B4C();
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = self;
  sub_1000652B8(v7);

  swift_bridgeObjectRelease(v7);
}

- (_TtC9ShortcutsP33_F50140E0B90057F770640AD097868D8228ContextualActionEventTracker)init
{
  sub_1000653A0();
}

@end
