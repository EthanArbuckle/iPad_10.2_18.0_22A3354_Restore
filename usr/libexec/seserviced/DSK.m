@implementation DSK

+ (_TtC10seserviced3DSK)shared
{
  return (_TtC10seserviced3DSK *)sub_1001EEFE4((uint64_t)a1, (uint64_t)a2, &qword_1003447B0, (id *)&qword_100354EE0, (uint64_t)sub_1001EEF58);
}

+ (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)sub_1001EEFE4((uint64_t)a1, (uint64_t)a2, &qword_1003447B8, (id *)&qword_100354EE8, (uint64_t)sub_1001EEFA4);
}

- (_TtC10seserviced3DSK)init
{
  return (_TtC10seserviced3DSK *)sub_1001EF23C();
}

- (void)startWithModule:(int64_t)a3
{
  _TtC10seserviced3DSK *v4;

  v4 = self;
  sub_1001EF7E8(a3);

}

- (void)stopWithModule:(int64_t)a3
{
  _TtC10seserviced3DSK *v4;

  v4 = self;
  sub_1001EFE98(a3);

}

- (void)stop
{
  _TtC10seserviced3DSK *v2;

  v2 = self;
  sub_1001F04E0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced3DSK_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isRunning[OBJC_IVAR____TtC10seserviced3DSK_lowPowerHandlerName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced3DSK_runningModules));
}

+ (void)mandatoryInit
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *, uint64_t, uint64_t);
  id v8;
  void (*v9)(_QWORD *, uint64_t);
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;

  v0 = type metadata accessor for DispatchPredicate(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (uint64_t *)((char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1003447B8 != -1)
    swift_once(&qword_1003447B8, sub_1001EEFA4);
  v5 = qword_100354EE8;
  *v4 = qword_100354EE8;
  v6 = enum case for DispatchPredicate.onQueue(_:);
  v7 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v1 + 104);
  v7(v4, enum case for DispatchPredicate.onQueue(_:), v0);
  v8 = (id)v5;
  LOBYTE(v5) = _dispatchPreconditionTest(_:)(v4);
  v9 = *(void (**)(_QWORD *, uint64_t))(v1 + 8);
  v9(v4, v0);
  if ((v5 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v10 = qword_100354EE8;
  *v4 = qword_100354EE8;
  v7(v4, v6, v0);
  v11 = (id)v10;
  LOBYTE(v10) = _dispatchPreconditionTest(_:)(v4);
  v9(v4, v0);
  if ((v10 & 1) == 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_10017B4DC();
  v12 = (void *)qword_100354EE8;
  *v4 = qword_100354EE8;
  v7(v4, v6, v0);
  v13 = v12;
  v14 = _dispatchPreconditionTest(_:)(v4);
  v9(v4, v0);
  if ((v14 & 1) != 0)
  {
    sub_10007D4F8();
    return;
  }
LABEL_9:
  __break(1u);
}

@end
