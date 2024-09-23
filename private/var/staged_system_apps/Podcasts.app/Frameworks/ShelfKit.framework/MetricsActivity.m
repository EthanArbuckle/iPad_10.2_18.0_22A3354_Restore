@implementation MetricsActivity

- (void)dealloc
{
  _TtC8ShelfKit15MetricsActivity *v2;

  v2 = self;
  MetricsActivity.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_pageContextTracker));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state));
}

+ (_TtC8ShelfKit15MetricsActivity)shared
{
  if (qword_3B0108 != -1)
    swift_once(&qword_3B0108, sub_13CAD4);
  return (_TtC8ShelfKit15MetricsActivity *)(id)qword_3BBC50;
}

- (NSString)pageContext
{
  _TtC8ShelfKit15MetricsActivity *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  PageContextTracker.value.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlayReason:(unint64_t)a3
{
  sub_13D870((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_141394);
}

- (void)setInitiator:(unint64_t)a3
{
  sub_13D870((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_14135C);
}

- (NSString)playContext
{
  _TtC8ShelfKit15MetricsActivity *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  MetricsActivity.playContext.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setStopReason:(unint64_t)a3
{
  sub_13D870((char *)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_141324);
}

- (NSString)stopContext
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _TtC8ShelfKit15MetricsActivity *v7;
  char *v8;
  uint64_t v9;
  id v11;
  NSString v12;
  uint64_t v13;

  v3 = type metadata accessor for MetricsActivity.State(0);
  __chkstk_darwin(v3);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  v7 = self;
  OSAllocatedUnfairLock.current.getter(v5, v6, v3);
  v8 = (char *)v5 + *(int *)(v3 + 40);
  v9 = *(_QWORD *)v8;
  LOBYTE(v6) = v8[8];
  sub_145D8((uint64_t)v5, type metadata accessor for MetricsActivity.State);
  if ((v6 & 1) != 0)
  {

    return (NSString *)0;
  }
  else
  {
    v11 = (id)NSPersistentStringFromMTStopReason(v9);
    static String._unconditionallyBridgeFromObjectiveC(_:)(v11);

    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return (NSString *)v12;
  }
}

- (NSString)stopType
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _TtC8ShelfKit15MetricsActivity *v7;
  char *v8;
  uint64_t v9;
  id v11;
  NSString v12;
  uint64_t v13;

  v3 = type metadata accessor for MetricsActivity.State(0);
  __chkstk_darwin(v3);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  v7 = self;
  OSAllocatedUnfairLock.current.getter(v5, v6, v3);
  v8 = (char *)v5 + *(int *)(v3 + 32);
  v9 = *(_QWORD *)v8;
  LOBYTE(v6) = v8[8];
  sub_145D8((uint64_t)v5, type metadata accessor for MetricsActivity.State);
  if ((v6 & 1) != 0)
  {

    return (NSString *)0;
  }
  else
  {
    v11 = (id)NSPersistentStringFromMTPlaybackAdjustmentInitiator(v9);
    static String._unconditionallyBridgeFromObjectiveC(_:)(v11);

    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return (NSString *)v12;
  }
}

- (void)clearStopInfo
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _TtC8ShelfKit15MetricsActivity *v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  v3 = v2 + *(_QWORD *)(class metadata base offset for ManagedBuffer + *(_QWORD *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_13DD40(v3);
  os_unfair_lock_unlock(v4);

}

- (_TtC8ShelfKit15MetricsActivity)init
{
  _TtC8ShelfKit15MetricsActivity *result;

  result = (_TtC8ShelfKit15MetricsActivity *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.MetricsActivity", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
