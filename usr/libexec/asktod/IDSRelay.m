@implementation IDSRelay

- (_TtC6asktod8IDSRelay)init
{
  _TtC6asktod8IDSRelay *result;

  sub_100029CC8();
  return result;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC6asktod8IDSRelay *v18;

  v8 = a6;
  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v8 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_10002DC9C(a3, v12, v13, (uint64_t)v8);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v12);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC6asktod8IDSRelay *v18;

  if (a5)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_10002E3A0(v12, v14, a6, (uint64_t)a7);

  swift_bridgeObjectRelease(v14);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6asktod8IDSRelay_pendingSendCompletions));
}

@end
