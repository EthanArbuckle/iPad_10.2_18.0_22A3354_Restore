@implementation AccessoryServer

- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4
{
  id v7;
  _TtC14dockaccessoryd15AccessoryServer *v8;

  v7 = a3;
  v8 = self;
  sub_10012EAE8(a3, a4);

}

- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  _TtC14dockaccessoryd15AccessoryServer *v13;
  id v14;

  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = a6;
  sub_10013B9BC(a3, a4);

}

- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4
{
  id v5;
  _TtC14dockaccessoryd15AccessoryServer *v6;

  v5 = a3;
  v6 = self;
  sub_100141A08("accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay");

}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
  id v7;
  _TtC14dockaccessoryd15AccessoryServer *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a4;
  sub_10012F750(a3, (uint64_t)a4);

}

- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4
{
  id v5;
  _TtC14dockaccessoryd15AccessoryServer *v6;

  v5 = a3;
  v6 = self;
  sub_100141A08("accessoryServer:updatePairingProgress");

}

- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  id v8;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC14dockaccessoryd15AccessoryServer *v15;

  v8 = a4;
  if (a4)
  {
    v11 = sub_100090EE8(0, &qword_10026D780, off_100235E40);
    v8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v11);
  }
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_10013C860(a3, (uint64_t)v8, (uint64_t)a6);

  swift_bridgeObjectRelease(v8);
}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  uint64_t v9;
  id v10;
  id v11;
  _TtC14dockaccessoryd15AccessoryServer *v12;

  if (a4)
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, (char *)&type metadata for Any + 8);
  else
    v9 = 0;
  v10 = a3;
  v11 = a5;
  v12 = self;
  sub_10013DEE0(a3, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristic:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _TtC14dockaccessoryd15AccessoryServer *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15 = self;
  v12 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;

  sub_10013872C(a3, a4, v12, v14);
  sub_10009B2FC((uint64_t)v12, v14);

}

- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  id v5;
  _TtC14dockaccessoryd15AccessoryServer *v6;

  v5 = a3;
  v6 = self;
  sub_100141A08("accessoryServer:didUpdateHasPairings");

}

- (void)accessoryServerDidUpdateStateNumber:(id)a3
{
  id v4;
  _TtC14dockaccessoryd15AccessoryServer *v5;

  v4 = a3;
  v5 = self;
  sub_100141A08("accessoryServerDidUpdateStateNumber");

}

- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd15AccessoryServer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100141A08("accessoryServer:didUpdateCategory");

}

- (void)accessoryServer:(id)a3 didUpdateName:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC14dockaccessoryd15AccessoryServer *v9;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100141A08("accessoryServer:didUpdateName");

  swift_bridgeObjectRelease(v7);
}

- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _TtC14dockaccessoryd15AccessoryServer *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _TtC14dockaccessoryd15AccessoryServer *v26;
  uint64_t v27;

  v11 = sub_10009061C(&qword_10026EA20);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v14 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  v16 = a3;
  if (!a5)
  {
    v25 = a6;
    v26 = self;
    v21 = 0xF000000000000000;
    if (a6)
      goto LABEL_6;
LABEL_8:
    v22 = 0;
    v24 = 0;
    goto LABEL_9;
  }
  v17 = a5;
  v18 = a6;
  v19 = self;
  a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
    goto LABEL_8;
LABEL_6:
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

LABEL_9:
  sub_100139200(v16, (uint64_t)v13, (uint64_t)a5, v21, v22, v24);
  swift_bridgeObjectRelease(v24);
  sub_10009E3A0((uint64_t)a5, v21);

  sub_10009B2C0((uint64_t)v13, &qword_10026EA20);
}

- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5
{
  id v6;
  id v8;
  id v9;
  _TtC14dockaccessoryd15AccessoryServer *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC14dockaccessoryd15AccessoryServer *v18;

  v6 = a4;
  if (!a4)
  {
    v16 = a3;
    v17 = a5;
    v18 = self;
    v13 = 0xF000000000000000;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v8 = a3;
  v9 = a5;
  v10 = self;
  v11 = v6;
  v6 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v13 = v12;

  if (!a5)
    goto LABEL_5;
LABEL_3:
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;

LABEL_6:
  sub_100141A08("accessoryServer:validateCert");
  swift_bridgeObjectRelease(v15);
  sub_10009E3A0((uint64_t)v6, v13);

}

- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC14dockaccessoryd15AccessoryServer *v16;
  unint64_t v17;
  unint64_t v18;
  _TtC14dockaccessoryd15AccessoryServer *v19;
  uint64_t v20;

  v9 = sub_10009061C(&qword_10026EA20);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  if (a5)
  {
    v15 = a5;
    v16 = self;
    a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v18 = v17;

  }
  else
  {
    v19 = self;
    v18 = 0xF000000000000000;
  }
  sub_100141774(v14);
  sub_10009E3A0((uint64_t)a5, v18);

  sub_10009B2C0((uint64_t)v11, &qword_10026EA20);
}

- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC14dockaccessoryd15AccessoryServer *v16;
  unint64_t v17;
  unint64_t v18;
  _TtC14dockaccessoryd15AccessoryServer *v19;
  uint64_t v20;

  v9 = sub_10009061C(&qword_10026EA20);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  if (a5)
  {
    v15 = a5;
    v16 = self;
    a5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v18 = v17;

  }
  else
  {
    v19 = self;
    v18 = 0xF000000000000000;
  }
  sub_100139C70(v14, (uint64_t)v11, (uint64_t)a5, v18);
  sub_10009E3A0((uint64_t)a5, v18);

  sub_10009B2C0((uint64_t)v11, &qword_10026EA20);
}

- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4
{
  id v7;
  _TtC14dockaccessoryd15AccessoryServer *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a4;
  sub_10013A13C(a3, (unint64_t)a4);

}

- (void)accessoryServerNeedsOwnershipToken:(id)a3
{
  id v4;
  _TtC14dockaccessoryd15AccessoryServer *v5;

  v4 = a3;
  v5 = self;
  sub_100141A08("accessoryServerNeedsOwnershipToken");

}

- (_TtC14dockaccessoryd15AccessoryServer)init
{
  return (_TtC14dockaccessoryd15AccessoryServer *)sub_10013A54C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd15AccessoryServer_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd15AccessoryServer_auth));
}

@end
