@implementation KeyValueStoreCustomObserver

- (void)dealloc
{
  void (*v2)(void);
  _TtC14bluetoothuserd27KeyValueStoreCustomObserver *v3;
  objc_super v4;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for KeyValueStoreCustomObserver();
  -[KeyValueStoreCustomObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_dispatchQueue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_cloudDefaults));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_monitoredUserDefaultKeys));
  swift_release(*(_QWORD *)&self->dispatchQueue[OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_notify]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_cloudKVSChangedNotification));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC14bluetoothuserd27KeyValueStoreCustomObserver *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  _TtC14bluetoothuserd27KeyValueStoreCustomObserver *v22;
  _OWORD v23[2];

  if (a3)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v9 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain(a4);
      v12 = a5;
      v13 = self;
      _bridgeAnyObjectToAny(_:)(v23, a4);
      swift_unknownObjectRelease(a4);
      if (a5)
        goto LABEL_4;
LABEL_8:
      v17 = 0;
      if (v11)
        goto LABEL_5;
LABEL_9:

      goto LABEL_10;
    }
  }
  memset(v23, 0, sizeof(v23));
  v21 = a5;
  v22 = self;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey();
  v15 = v14;
  v16 = sub_10000219C(&qword_10007A8C8, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_100060868);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v15, (char *)&type metadata for Any + 8, v16);

  if (!v11)
    goto LABEL_9;
LABEL_5:
  v18 = sub_10000215C((uint64_t *)&unk_10007B630);
  v19 = swift_allocObject(v18, 48, 7);
  *(_OWORD *)(v19 + 16) = xmmword_1000606F0;
  *(_QWORD *)(v19 + 32) = v9;
  *(_QWORD *)(v19 + 40) = v11;
  v20 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x108);
  swift_bridgeObjectRetain(v11);
  v20(2, v19);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v17);
  v17 = v19;
LABEL_10:
  swift_bridgeObjectRelease(v17);
  sub_100006C5C((uint64_t)v23);
}

- (void)handleUbiquitousKeyValueStoreChangeWithNotification:(id)a3
{
  sub_1000060B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100005B90);
}

- (void)handleUbiquitousKeyValueStoreChangeLocallyWithNotification:(id)a3
{
  sub_1000060B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100005F5C);
}

- (_TtC14bluetoothuserd27KeyValueStoreCustomObserver)init
{
  _TtC14bluetoothuserd27KeyValueStoreCustomObserver *result;

  result = (_TtC14bluetoothuserd27KeyValueStoreCustomObserver *)_swift_stdlib_reportUnimplementedInitializer("bluetoothuserd.KeyValueStoreCustomObserver", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
