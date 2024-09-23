@implementation FMETAOperation

- (BOOL)isFinished
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC6FindMy14FMETAOperation__isFinished);
}

- (void)setFinished:(BOOL)a3
{
  _TtC6FindMy14FMETAOperation *v4;
  NSString v5;
  NSString v6;

  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[FMETAOperation willChangeValueForKey:](v4, "willChangeValueForKey:", v5);

  *((_BYTE *)&v4->super.super.isa + OBJC_IVAR____TtC6FindMy14FMETAOperation__isFinished) = a3;
  v6 = String._bridgeToObjectiveC()();
  -[FMETAOperation didChangeValueForKey:](v4, "didChangeValueForKey:", v6);

}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _TtC6FindMy14FMETAOperation *v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  _TtC6FindMy14FMETAOperation *v7;
  NSObject *oslog;

  v2 = self;
  if (-[FMETAOperation isCancelled](v2, "isCancelled"))
  {
    if (qword_1005D1DE8 != -1)
      swift_once(&qword_1005D1DE8, sub_100005ADC);
    v3 = type metadata accessor for Logger(0);
    v4 = sub_100056D88(v3, (uint64_t)qword_1005F5748);
    oslog = Logger.logObject.getter(v4);
    v5 = static os_log_type_t.default.getter(oslog);
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v5, "FMETAOperation: operation cancelled", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }

    v7 = (_TtC6FindMy14FMETAOperation *)oslog;
  }
  else
  {
    v7 = v2;
  }

}

- (void)start
{
  _TtC6FindMy14FMETAOperation *v2;

  v2 = self;
  sub_10037BC20();

}

- (_TtC6FindMy14FMETAOperation)init
{
  _TtC6FindMy14FMETAOperation *result;

  result = (_TtC6FindMy14FMETAOperation *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMETAOperation", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&self->request[OBJC_IVAR____TtC6FindMy14FMETAOperation_request];
  v4 = *(void **)&self->request[OBJC_IVAR____TtC6FindMy14FMETAOperation_request + 8];

  swift_bridgeObjectRelease(v3);
  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC6FindMy14FMETAOperation_completion]);
}

@end
