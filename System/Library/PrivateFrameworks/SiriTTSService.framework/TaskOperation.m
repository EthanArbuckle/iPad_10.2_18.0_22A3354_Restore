@implementation TaskOperation

- (void)main
{
  _TtC14SiriTTSService13TaskOperation *v2;

  v2 = self;
  sub_19AD7D478();

}

- (void)cancel
{
  _TtC14SiriTTSService13TaskOperation *v2;

  v2 = self;
  sub_19AD7D808();

}

- (NSString)description
{
  _TtC14SiriTTSService13TaskOperation *v2;
  void *v3;

  v2 = self;
  sub_19AD7DA30();

  v3 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14SiriTTSService13TaskOperation)init
{
  TaskOperation.init()();
}

- (void).cxx_destruct
{

  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  sub_19AD68EB4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError), *(uint64_t *)((char *)&self->super._iop.__prevOp + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError), *(uint64_t *)((char *)&self->super._iop.__nextOp + OBJC_IVAR____TtC14SiriTTSService13TaskOperation_workflowError));
}

@end
