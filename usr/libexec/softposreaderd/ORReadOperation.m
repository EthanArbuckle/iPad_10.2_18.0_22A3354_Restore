@implementation ORReadOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC9SPREngine15ORReadOperation *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(_BYTE *)(v2 + 16);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setExecuting:(BOOL)a3
{
  _TtC9SPREngine15ORReadOperation *v4;
  NSString v5;
  uint64_t v6;
  NSString v7;

  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[ORReadOperation willChangeValueForKey:](v4, "willChangeValueForKey:", v5);

  v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(_BYTE *)(v6 + 16) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  v7 = String._bridgeToObjectiveC()();
  -[ORReadOperation didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

}

- (BOOL)isFinished
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC9SPREngine15ORReadOperation *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(_BYTE *)(v2 + 17);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setFinished:(BOOL)a3
{
  _TtC9SPREngine15ORReadOperation *v4;
  NSString v5;
  uint64_t v6;
  NSString v7;

  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  -[ORReadOperation willChangeValueForKey:](v4, "willChangeValueForKey:", v5);

  v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(_BYTE *)(v6 + 17) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  v7 = String._bridgeToObjectiveC()();
  -[ORReadOperation didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

}

- (void)dealloc
{
  _TtC9SPREngine15ORReadOperation *v2;

  v2 = self;
  sub_1000271C4();
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

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC9SPREngine15ORReadOperation_delegate));
  swift_release(*(_QWORD *)&self->lockedState[OBJC_IVAR____TtC9SPREngine15ORReadOperation_completion]);
  sub_100005D3C((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_managedData));

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_analytics));
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_timeoutWorkItem));
  swift_bridgeObjectRelease(*(_TtC14softposreaderd12RemoteReader **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SPREngine15ORReadOperation_provisionReadResult), v3, v4, v5, v6, v7, v8, v9);

}

- (void)cancel
{
  _TtC9SPREngine15ORReadOperation *v2;

  v2 = self;
  sub_1000273C4();

}

- (void)start
{
  _TtC9SPREngine15ORReadOperation *v2;

  v2 = self;
  sub_100028C50();

}

- (void)handleSessionReachedTimeLimit
{
  _TtC9SPREngine15ORReadOperation *v2;

  v2 = self;
  sub_10002A804();

}

- (void)readerSession:(id)a3 didReceiveThermalIndication:(BOOL)a4
{
  id v6;
  _TtC9SPREngine15ORReadOperation *v7;

  v6 = a3;
  v7 = self;
  sub_10002AA58((uint64_t)v6, a4);

}

- (void)secureElementReaderSessionDidEndUnexpectedly:(id)a3
{
  id v4;
  _TtC9SPREngine15ORReadOperation *v5;

  v4 = a3;
  v5 = self;
  sub_10002AF64((uint64_t)v4);

}

- (void)readerSession:(id)a3 didStart:(id)a4
{
  sub_10002BD38(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_10002B498);
}

- (void)readerSession:(id)a3 didEnd:(id)a4
{
  sub_10002BD38(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_10002BB54);
}

- (void)readerSession:(id)a3 receivedData:(id)a4 fromApplet:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _TtC14softposreaderd12RemoteReader *v15;
  _TtC14softposreaderd12RemoteReader *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _TtC9SPREngine15ORReadOperation *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v16 = v15;

  sub_10002BDC0((uint64_t)v8, v11, v13, v14, (uint64_t)v16);
  swift_bridgeObjectRelease(v16, v17, v18, v19, v20, v21, v22, v23);
  sub_100005DE0(v11, v13);

}

- (_TtC9SPREngine15ORReadOperation)init
{
  _TtC9SPREngine15ORReadOperation *result;

  result = (_TtC9SPREngine15ORReadOperation *)_swift_stdlib_reportUnimplementedInitializer("SPREngine.ORReadOperation", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
