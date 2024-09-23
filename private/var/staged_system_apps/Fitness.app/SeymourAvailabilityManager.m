@implementation SeymourAvailabilityManager

- (BOOL)available
{
  _TtC10FitnessApp26SeymourAvailabilityManager *v2;
  char v3;

  v2 = self;
  v3 = sub_10002AAFC();

  return v3 & 1;
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)init
{
  return (_TtC10FitnessApp26SeymourAvailabilityManager *)sub_10000DCDC();
}

+ (NSString)seymourAvailabilityDidChangeNotification
{
  if (qword_10081D5F0 != -1)
    swift_once(&qword_10081D5F0, sub_10004E29C);
  return (NSString *)(id)qword_100869F10;
}

- (void)updateAvailability
{
  _TtC10FitnessApp26SeymourAvailabilityManager *v2;

  v2 = self;
  sub_100026238();

}

- (BOOL)unavailable
{
  _TtC10FitnessApp26SeymourAvailabilityManager *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100166974();

  return v3;
}

- (BOOL)stateKnown
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = type metadata accessor for SeymourAvailabilityManager.State(0);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_state;
  swift_beginAccess(v6, v10, 0, 0);
  sub_10002AD54((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for ContentAvailability(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_100154058((uint64_t)v5);
  return (char)v6;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_contentAvailabilityClient));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_eventHub));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_subscriptionToken));
  sub_100154058((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_state);
}

@end
