@implementation ReadOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC9SPREngine13ReadOperation *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(_BYTE *)(v2 + 16);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setExecuting:(BOOL)a3
{
  _TtC9SPREngine13ReadOperation *v4;
  NSString v5;
  uint64_t v6;
  NSString v7;

  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[ReadOperation willChangeValueForKey:](v4, "willChangeValueForKey:", v5);

  v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(_BYTE *)(v6 + 16) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  v7 = String._bridgeToObjectiveC()();
  -[ReadOperation didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

}

- (BOOL)isFinished
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC9SPREngine13ReadOperation *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(_BYTE *)(v2 + 17);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setFinished:(BOOL)a3
{
  _TtC9SPREngine13ReadOperation *v4;
  NSString v5;
  uint64_t v6;
  NSString v7;

  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[ReadOperation willChangeValueForKey:](v4, "willChangeValueForKey:", v5);

  v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(_BYTE *)(v6 + 17) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  v7 = String._bridgeToObjectiveC()();
  -[ReadOperation didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

}

- (void)dealloc
{
  _TtC9SPREngine13ReadOperation *v2;

  v2 = self;
  sub_1000A0AF4();
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_lockedState));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_readerConfig));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_callback));

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_timeoutWorkItem));
  sub_100005D3C((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_auditor));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_analytics));

  sub_100005D3C((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_managedData));
  sub_100005D3C((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_secureElement));
  sub_100005D3C((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine13ReadOperation_secureTimeKeeper));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SPREngine13ReadOperation_vasResponse), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SPREngine13ReadOperation_readResult), v10, v11, v12, v13, v14, v15, v16);
}

- (void)cancel
{
  _TtC9SPREngine13ReadOperation *v2;

  v2 = self;
  sub_1000A0D30();

}

- (void)start
{
  _TtC9SPREngine13ReadOperation *v2;

  v2 = self;
  sub_1000A20D8();

}

- (void)handleSessionReachedTimeLimit
{
  _TtC9SPREngine13ReadOperation *v2;

  v2 = self;
  sub_1000A46F0();

}

- (void)readerSession:(id)a3 didReceiveThermalIndication:(BOOL)a4
{
  id v6;
  _TtC9SPREngine13ReadOperation *v7;

  v6 = a3;
  v7 = self;
  sub_1000A4944((uint64_t)v6, a4);

}

- (void)secureElementReaderSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  _TtC9SPREngine13ReadOperation *v5;

  v4 = a3;
  v5 = self;
  sub_1000A4EF8((uint64_t)v4);

}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  uint64_t v7;
  _TtC14softposreaderd12RemoteReader *v8;
  id v9;
  _TtC9SPREngine13ReadOperation *v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = sub_100005E24(0, &qword_1001B1328, NFTag_ptr);
  v8 = (_TtC14softposreaderd12RemoteReader *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1000A53D8((uint64_t)v9, (uint64_t)v8);

  swift_bridgeObjectRelease(v8, v11, v12, v13, v14, v15, v16, v17);
}

- (void)readerSession:(id)a3 didStart:(id)a4
{
  sub_10002BD38(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_1000A9F78);
}

- (void)readerSession:(id)a3 didEnd:(id)a4
{
  sub_10002BD38(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_1000AA498);
}

- (void)readerSession:(id)a3 receivedData:(id)a4 fromApplet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _TtC14softposreaderd12RemoteReader *v14;
  _TtC14softposreaderd12RemoteReader *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _TtC9SPREngine13ReadOperation *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

  static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v15 = v14;

  sub_1000AA934((uint64_t)v8, v11, v13);
  swift_bridgeObjectRelease(v15, v16, v17, v18, v19, v20, v21, v22);
  sub_100005DE0(v11, v13);

}

- (_TtC9SPREngine13ReadOperation)init
{
  _TtC9SPREngine13ReadOperation *result;

  result = (_TtC9SPREngine13ReadOperation *)_swift_stdlib_reportUnimplementedInitializer("SPREngine.ReadOperation", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
