@implementation BaseOperation

- (void)start
{
  _TtC8Podcasts13BaseOperation *v2;

  v2 = self;
  sub_10002ED8C();

}

- (BOOL)isFinished
{
  _TtC8Podcasts13BaseOperation *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10002F680();

  return v3;
}

- (BOOL)isExecuting
{
  _TtC8Podcasts13BaseOperation *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100030528();

  return v3;
}

- (BOOL)isReady
{
  _TtC8Podcasts13BaseOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_1000305F8();

  return v3 & 1;
}

- (_TtC8Podcasts13BaseOperation)init
{
  return (_TtC8Podcasts13BaseOperation *)sub_10003C6C0();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation_lock));
  swift_errorRelease(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation__error));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts13BaseOperation__onFinishBlocks));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler), *(_QWORD *)&self->lock[OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler]);
  sub_10002CA30(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Podcasts13BaseOperation_onError), *(_QWORD *)&self->lock[OBJC_IVAR____TtC8Podcasts13BaseOperation_onError]);
}

- (void)setExecuting:(BOOL)a3
{
  _TtC8Podcasts13BaseOperation *v3;

  v3 = self;
  sub_10002EE20();

}

- (void)setFinished:(BOOL)a3
{
  _TtC8Podcasts13BaseOperation *v3;

  v3 = self;
  sub_100044D6C();

}

- (void)addDependency:(id)a3
{
  id v4;
  _TtC8Podcasts13BaseOperation *v5;

  v4 = a3;
  v5 = self;
  sub_100365208(v4, (uint64_t)v5);

}

@end
