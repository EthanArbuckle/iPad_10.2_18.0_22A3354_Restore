@implementation CRLRateLimiter

- (_TtC8Freeform14CRLRateLimiter)initWithIntervalInSeconds:(double)a3
{
  uint64_t v5;
  _TtC8Freeform14CRLRateLimiter *v6;
  __n128 v7;
  objc_class *v8;
  _QWORD *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC8Freeform14CRLRateLimiter_queue;
  sub_100503E34();
  v6 = self;
  v8 = (objc_class *)static OS_dispatch_queue.main.getter(v7);
  *(Class *)((char *)&self->super.isa + v5) = v8;
  v9 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_currentExecBlock);
  *v9 = 0;
  v9[1] = 0;
  static Date.distantPast.getter(v8);
  *(double *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_interval) = a3;

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for CRLRateLimiter(0);
  return -[CRLRateLimiter init](&v11, "init");
}

- (void)exec:(id)a3
{
  void *v4;
  _TtC8Freeform14CRLRateLimiter *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100CEE444((uint64_t)v5, (uint64_t (**)(_QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC8Freeform14CRLRateLimiter)init
{
  _TtC8Freeform14CRLRateLimiter *result;

  result = (_TtC8Freeform14CRLRateLimiter *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLRateLimiter", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1004C1024(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_currentExecBlock), *(_QWORD *)&self->queue[OBJC_IVAR____TtC8Freeform14CRLRateLimiter_currentExecBlock]);
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_lastExecutionTime;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
