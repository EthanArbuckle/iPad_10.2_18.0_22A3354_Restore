@implementation KTWatchdog

- (_TtC13transparencyd10KTWatchdog)initWithControl:(id)a3
{
  _TtC13transparencyd10KTWatchdog *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC13transparencyd10KTWatchdog *)sub_1000B8ACC((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (NSString)description
{
  uint64_t (*v2)(void);
  _TtC13transparencyd10KTWatchdog *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  NSString v12;
  uint64_t v14;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v3 = self;
  v14 = v2();
  v4 = sub_10006F03C(&qword_1002A0768);
  v5 = sub_100097360((unint64_t *)&unk_1002A0770, &qword_1002A0768, (uint64_t)&protocol conformance descriptor for [A : B].Keys);
  v6 = sub_10007E948();
  v7 = Sequence<>.joined(separator:)(44, 0xE100000000000000, v4, v5, v6);
  v9 = v8;
  swift_bridgeObjectRelease(v14);
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 62;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);

  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEB000000003C676FLL);
  return (NSString *)v12;
}

+ (BOOL)isInDebugger
{
  return _s13transparencyd10KTWatchdogC12isInDebuggerSbyFZ_0() & 1;
}

- (void)resume
{
  uint64_t (*v2)(void);
  uint64_t v3;
  _TtC13transparencyd10KTWatchdog *v4;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  v4 = self;
  v3 = v2();
  swift_unknownObjectRelease(v3);
  if (!v3)
    (*(void (**)(void))((swift_isaMask & (uint64_t)v4->super.isa) + 0xD8))();

}

- (void)addWithNamed:(id)a3 watcher:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC13transparencyd10KTWatchdog *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_100243118, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  KTWatchdog.add(named:watcher:)(v7, v9, (uint64_t)sub_1000B9738, v10);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (id)checkWatchDogs
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _TtC13transparencyd10KTWatchdog *v8;
  id v9;
  id result;
  uint64_t v11;
  _TtC13transparencyd10KTWatchdog *v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;

  v3 = type metadata accessor for DispatchPredicate(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (uint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_workQueue);
  *v6 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for DispatchPredicate.onQueue(_:), v3);
  v8 = self;
  v9 = v7;
  LOBYTE(self) = _dispatchPreconditionTest(_:)(v6);
  result = (id)(*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v6, v3);
  if ((self & 1) != 0)
  {
    v11 = (*(uint64_t (**)(id))((swift_isaMask & (uint64_t)v8->super.isa) + 0x88))(result);
    v12 = v8;
    sub_1000B938C((uint64_t)_swiftEmptyArrayStorage, v11, v12);
    v14 = v13;
    swift_bridgeObjectRelease(v11);

    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)runWatchDog
{
  _TtC13transparencyd10KTWatchdog *v2;

  v2 = self;
  sub_1000B78A0();

}

- (void)stopWatchDog
{
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  _TtC13transparencyd10KTWatchdog *v5;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  v5 = self;
  v3 = v2();
  if (v3)
  {
    v4 = v3;
    swift_getObjectType();
    OS_dispatch_source.cancel()();

    swift_unknownObjectRelease(v4);
  }
  else
  {

  }
}

- (_TtC13transparencyd10KTWatchdog)init
{
  _TtC13transparencyd10KTWatchdog *result;

  result = (_TtC13transparencyd10KTWatchdog *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTWatchdog", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_watchers));
  v3 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13transparencyd10KTWatchdog_pending;
  v6 = sub_10006F03C(&qword_1002A07A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd10KTWatchdog_intervalTimer));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd10KTWatchdog_dep));
}

@end
