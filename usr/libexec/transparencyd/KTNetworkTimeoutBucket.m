@implementation KTNetworkTimeoutBucket

- (_TtC13transparencyd22KTNetworkTimeoutBucket)init
{
  return (_TtC13transparencyd22KTNetworkTimeoutBucket *)KTNetworkTimeoutBucket.init()();
}

- (NSString)sysdiagnose
{
  _TtC13transparencyd22KTNetworkTimeoutBucket *v2;
  uint64_t v3;
  NSString v4;
  _QWORD v6[4];
  _QWORD v7[2];

  v6[2] = self;
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)(v7, sub_1000B3D58, v6, &type metadata for String);

  v3 = v7[1];
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (id)networkTimeoutOperation
{
  _TtC13transparencyd22KTNetworkTimeoutBucket *v2;
  uint64_t v3;
  _QWORD v5[5];
  id v6;

  v5[2] = self;
  v2 = self;
  v3 = sub_10006F03C(&qword_1002A0580);
  OS_dispatch_queue.sync<A>(execute:)(&v6, sub_1000B31C0, v5, v3);

  return v6;
}

- (id)onQueueNetworkTimeoutOperation
{
  _TtC13transparencyd22KTNetworkTimeoutBucket *v2;
  void *v3;

  v2 = self;
  v3 = (void *)KTNetworkTimeoutBucket.onQueueNetworkTimeoutOperation()();

  return v3;
}

- (void)networkWithFeedback:(int64_t)a3
{
  _TtC13transparencyd22KTNetworkTimeoutBucket *v4;

  v4 = self;
  KTNetworkTimeoutBucket.network(feedback:)(a3);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_quickStart));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_networkTimeout));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_networkTimeoutDependency));
}

@end
