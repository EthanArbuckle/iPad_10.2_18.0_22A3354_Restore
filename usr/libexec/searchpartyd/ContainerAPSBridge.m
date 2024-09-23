@implementation ContainerAPSBridge

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC12searchpartyd18ContainerAPSBridge *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC12searchpartyd18ContainerAPSBridge *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_10098E254(v9, v11);
  sub_10001EF3C(v9, v11);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v8;
  id v10;
  id v11;
  id v12;
  _TtC12searchpartyd18ContainerAPSBridge *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  _TtC12searchpartyd18ContainerAPSBridge *v26;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v16 = v15;

    if (a5)
      goto LABEL_3;
LABEL_6:
    v17 = 0;
    v19 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v20 = 0;
    v22 = 0;
    goto LABEL_8;
  }
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v26 = self;
  v16 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;

  if (!a6)
    goto LABEL_7;
LABEL_4:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v22 = v21;

LABEL_8:
  sub_10098E414((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001EF3C((uint64_t)v8, v16);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC12searchpartyd18ContainerAPSBridge *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10098E630(a4);

}

- (_TtC12searchpartyd18ContainerAPSBridge)init
{
  _TtC12searchpartyd18ContainerAPSBridge *result;

  result = (_TtC12searchpartyd18ContainerAPSBridge *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.ContainerAPSBridge", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd18ContainerAPSBridge_delegate);
}

@end
