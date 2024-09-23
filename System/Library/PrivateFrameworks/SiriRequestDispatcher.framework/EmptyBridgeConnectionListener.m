@implementation EmptyBridgeConnectionListener

- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6
{
  id v8;
  id v9;

  sub_1C2F24604();
  sub_1C2F24604();
  v8 = a5;
  v9 = a6;
  return (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener *)sub_1C2F0EFA8();
}

- (void)resumeConnectionWithBridgeProxy:(id)a3
{
  _TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1C2F248E0();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)notifyClientWithBlock:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v3;
  swift_release();
}

- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)init
{
  sub_1C2F0F148();
}

@end
