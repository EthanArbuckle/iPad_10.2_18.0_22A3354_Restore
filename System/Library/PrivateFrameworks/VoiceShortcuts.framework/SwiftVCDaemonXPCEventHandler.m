@implementation SwiftVCDaemonXPCEventHandler

- (NSArray)streams
{
  void *v2;

  DaemonXPCEventHandler.streams.getter();
  type metadata accessor for VCXPCEventStream(0);
  v2 = (void *)sub_1C1546C78();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3 queue:(id)a4
{
  uint64_t v5;
  SwiftVCDaemonXPCEventHandler *result;

  type metadata accessor for VCXPCEventStream(0);
  v5 = sub_1C1546C84();
  DaemonXPCEventHandler.init(streams:queue:)(v5, a4);
  return result;
}

- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3
{
  SwiftVCDaemonXPCEventHandler *result;

  type metadata accessor for VCXPCEventStream(0);
  sub_1C1546C84();
  DaemonXPCEventHandler.init(streams:)();
  return result;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  id v9;
  SwiftVCDaemonXPCEventHandler *v10;

  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  sub_1C1476B60((uint64_t)a3, (uint64_t)a4, v9);
  swift_unknownObjectRelease();

}

- (void)removeObserver:(id)a3
{
  SwiftVCDaemonXPCEventHandler *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1C14774AC();
  swift_unknownObjectRelease();

}

- (void)removeObserver:(id)a3 name:(id)a4
{
  id v6;
  SwiftVCDaemonXPCEventHandler *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1C1477508();
  swift_unknownObjectRelease();

}

- (void)activate
{
  SwiftVCDaemonXPCEventHandler *v2;

  v2 = self;
  sub_1C1477BB0();

}

- (SwiftVCDaemonXPCEventHandler)init
{
  DaemonXPCEventHandler.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end
