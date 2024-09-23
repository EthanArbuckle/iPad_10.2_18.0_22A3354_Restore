@implementation LyonSE

+ (_TtC10seserviced6LyonSE)shared
{
  if (qword_100344558 != -1)
    swift_once(&qword_100344558, sub_10006449C);
  return (_TtC10seserviced6LyonSE *)(id)qword_100354A68;
}

- (_TtC10seserviced6LyonSE)init
{
  return (_TtC10seserviced6LyonSE *)sub_10006450C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced6LyonSE_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10006B9B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6LyonSE_cachedInitiateAccessProtocolData), *(_QWORD *)&self->cachedInitiateAccessProtocolData[OBJC_IVAR____TtC10seserviced6LyonSE_cachedInitiateAccessProtocolData]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced6LyonSE_urskSlotManager));
}

@end
