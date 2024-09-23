@implementation AccessoryKeystore

- (_TtC14dockaccessoryd17AccessoryKeystore)init
{
  return (_TtC14dockaccessoryd17AccessoryKeystore *)sub_10014FEF8((uint64_t)self, (uint64_t)a2);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->keyGroup[OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore_keyGroup]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore_table));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore_peripherals));
  swift_bridgeObjectRelease(*(_QWORD *)&self->keyGroup[OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore__activeController]);
}

- (id)getLocalPairingIdentity:(id *)a3
{
  return sub_100150574(self, (uint64_t)a2, (uint64_t)a3, sub_1001501D0);
}

- (id)getOrCreateLocalPairingIdentity:(id *)a3
{
  return sub_100150574(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_100150390);
}

- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5
{
  id v7;
  _TtC14dockaccessoryd17AccessoryKeystore *v8;

  v7 = a3;
  v8 = self;
  sub_1001543C4(a3);

  return 1;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8
{
  const void *v13;
  const void *v14;
  const void *v15;
  _TtC14dockaccessoryd17AccessoryKeystore *v16;

  if (a7)
  {
    v13 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
    v15 = v14;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = self;
  sub_1001506A4(a3, a4, a5, a6, v13, v15);

  swift_bridgeObjectRelease(v15);
  return 1;
}

- (BOOL)updateActiveControllerPairingIdentifier:(id)a3
{
  _TtC14dockaccessoryd17AccessoryKeystore *v3;
  _TtC14dockaccessoryd17AccessoryKeystore *v4;
  _TtC14dockaccessoryd17AccessoryKeystore *v5;
  _TtC14dockaccessoryd17AccessoryKeystore *v6;
  _TtC14dockaccessoryd17AccessoryKeystore **v7;
  _TtC14dockaccessoryd17AccessoryKeystore *v8;
  BOOL v9;
  _TtC14dockaccessoryd17AccessoryKeystore *v10;

  if (a3
    && (v3 = self,
        self = (_TtC14dockaccessoryd17AccessoryKeystore *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3),
        v4))
  {
    v5 = self;
    v6 = v4;
    v7 = (_TtC14dockaccessoryd17AccessoryKeystore **)((char *)v3
                                                    + OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore__activeController);
    v8 = v7[1];
    v9 = *v7 == self && v6 == v8;
    if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v7, v8, self, v6, 0) & 1) != 0)
    {
      swift_bridgeObjectRelease(v6);
      LOBYTE(self) = 0;
    }
    else
    {
      v10 = v7[1];
      *v7 = v5;
      v7[1] = v6;
      swift_bridgeObjectRelease(v10);
      LOBYTE(self) = 1;
    }
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (NSString)activeControllerPairingIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->keyGroup[OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore__activeController];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)removeControllerKeyPairWithError:(id *)a3
{
  _TtC14dockaccessoryd17AccessoryKeystore *v3;

  v3 = self;
  sub_10014FBF8(0, 0);

  return 1;
}

- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4
{
  _TtC14dockaccessoryd17AccessoryKeystore *v4;

  v4 = self;
  sub_10014FBF8(0, 0);

  return 1;
}

- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5
{
  const void *v6;
  const void *v7;
  const void *v8;
  _TtC14dockaccessoryd17AccessoryKeystore *v9;

  if (a3)
  {
    v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_10014FBF8(v6, v8);

  swift_bridgeObjectRelease(v8);
  return 1;
}

- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  const void *v6;
  const void *v7;
  const void *v8;
  _TtC14dockaccessoryd17AccessoryKeystore *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (a3)
  {
    v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
    v9 = self;
    sub_10014F2D0(v6, v8, 0);
    v16 = v15;
    v17 = *(id *)(v15 + 32);
    swift_bridgeObjectRelease(v8);

    swift_release(v16);
  }
  else
  {
    v12 = sub_1000ABB30();
    v13 = swift_allocError(&type metadata for DockdError, v12, 0, 0);
    *v14 = 2;
    swift_willThrow(v13);
    if (a4)
    {
      v10 = (void *)_convertErrorToNSError(_:)(v13);
      swift_errorRelease(v13);
      v11 = v10;
      v17 = 0;
      *a4 = v10;
    }
    else
    {
      swift_errorRelease(v13);
      v17 = 0;
    }
  }
  return v17;
}

- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5
{
  const void *v6;
  const void *v7;
  const void *v8;
  _TtC14dockaccessoryd17AccessoryKeystore *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class isa;

  if (a3)
  {
    v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  v10 = sub_100154974(v6, v8);
  v12 = v11;

  swift_bridgeObjectRelease(v8);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10009B2FC(v10, v12);
  return isa;
}

- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5
{
  id v6;
  id v8;
  _TtC14dockaccessoryd17AccessoryKeystore *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC14dockaccessoryd17AccessoryKeystore *v17;

  v6 = a3;
  if (!a3)
  {
    v16 = a4;
    v17 = self;
    v12 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v15 = 0;
    goto LABEL_6;
  }
  v8 = a4;
  v9 = self;
  v10 = v6;
  v6 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v12 = v11;

  if (!a4)
    goto LABEL_5;
LABEL_3:
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;

LABEL_6:
  sub_100150CEC((uint64_t)v6, v12, v13, v15);

  swift_bridgeObjectRelease(v15);
  sub_10009E3A0((uint64_t)v6, v12);
  return 1;
}

- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4
{
  id v6;
  _TtC14dockaccessoryd17AccessoryKeystore *v7;

  v6 = a3;
  v7 = self;
  sub_100150F70(a3);

  return 1;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4
{
  const void *v6;
  const void *v7;
  const void *v8;
  _TtC14dockaccessoryd17AccessoryKeystore *v9;
  char v10;

  if (a3)
  {
    v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  v10 = sub_100151284(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4
{
  const void *v5;
  const void *v6;
  const void *v7;
  _TtC14dockaccessoryd17AccessoryKeystore *v8;

  if (a3)
  {
    v5 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_10014F8C8(v5, v7);

  swift_bridgeObjectRelease(v7);
  return 1;
}

- (BOOL)removeAllAccessoryKeys:(id *)a3
{
  _TtC14dockaccessoryd17AccessoryKeystore *v3;

  v3 = self;
  sub_10014F8C8(0, 0);

  return 1;
}

- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _TtC14dockaccessoryd17AccessoryKeystore *v15;
  uint64_t v17;

  v8 = sub_10009061C(&qword_10026EA20);
  __chkstk_darwin(v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }
  v15 = self;
  sub_100151548((uint64_t)v10, (uint64_t)a4, v14);
  sub_10009B2C0((uint64_t)v10, &qword_10026EA20);

  swift_bridgeObjectRelease(v14);
  return 1;
}

- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC14dockaccessoryd17AccessoryKeystore *v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_100151E0C(v5, v7);

  swift_bridgeObjectRelease(v7);
  return 1;
}

- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3
{
  _TtC14dockaccessoryd17AccessoryKeystore *v3;

  v3 = self;
  sub_1001520E8();

  return 1;
}

- (id)getAssociatedControllerKeyForAccessory:(id)a3
{
  const void *v4;
  const void *v5;
  const void *v6;
  _TtC14dockaccessoryd17AccessoryKeystore *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a3)
  {
    v4 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
    v7 = self;
    sub_10014F2D0(v4, v6, 0);
    v9 = v8;
    v10 = *(id *)(v8 + 32);

    swift_bridgeObjectRelease(v6);
    swift_release(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  _TtC14dockaccessoryd17AccessoryKeystore *v14;
  Class isa;
  uint64_t v17;

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = self;
  sub_100152410((uint64_t)a3, v13, (uint64_t)v11);

  swift_bridgeObjectRelease(v13);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return isa;
}

- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _TtC14dockaccessoryd17AccessoryKeystore *v20;
  uint64_t v22;

  v13 = sub_10009061C(&qword_10026EA20);
  __chkstk_darwin(v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v16 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    v17 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  if (a4)
  {
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v19;
  }
  else
  {
    v18 = 0;
  }
  v20 = self;
  sub_100154ADC((uint64_t (*)(_QWORD, _QWORD, _QWORD))v15, v18, (unint64_t)a4, a5, a7);
  sub_10009B2C0((uint64_t)v15, &qword_10026EA20);

  swift_bridgeObjectRelease(a4);
  return 1;
}

@end
