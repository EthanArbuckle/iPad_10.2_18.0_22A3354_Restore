@implementation SportingEventRunningClock

- (_TtC9SportsKit25SportingEventRunningClock)init
{
  sub_2303521FC();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9SportsKit25SportingEventRunningClock_runningClockInterval;
  v3 = sub_230379F74();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  _TtC9SportsKit25SportingEventRunningClock *v4;
  _TtC9SportsKit25SportingEventRunningClock *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23037AA9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_230352F50((uint64_t)v8);

  sub_2303292FC((uint64_t)v8);
  return v6;
}

@end
