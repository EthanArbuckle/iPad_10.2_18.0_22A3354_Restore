@implementation PushServiceManager.PushDelegate

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  id v6;
  _TtCC3asd18PushServiceManager12PushDelegate *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtCC3asd18PushServiceManager12PushDelegate *v12;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v10 = v9;

  }
  else
  {
    v11 = a3;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  sub_10003301C((uint64_t)v4, v10);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtCC3asd18PushServiceManager12PushDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100032800((uint64_t)v8, a4);

}

- (_TtCC3asd18PushServiceManager12PushDelegate)init
{
  sub_100032ACC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100032F94((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtCC3asd18PushServiceManager12PushDelegate_pushDispatchManager));
  v3 = (char *)self + OBJC_IVAR____TtCC3asd18PushServiceManager12PushDelegate_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
