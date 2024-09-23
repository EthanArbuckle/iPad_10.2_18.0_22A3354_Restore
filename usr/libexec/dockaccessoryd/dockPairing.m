@implementation dockPairing

- (_TtC14dockaccessoryd11dockPairing)init
{
  return (_TtC14dockaccessoryd11dockPairing *)sub_100155578();
}

- (void)registerCardWithInfo:(id)a3 completion:(id)a4
{
  sub_100155A20(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_100155F38);
}

- (void)pairAccessoryWithInfo:(id)a3 completion:(id)a4
{
  sub_100155A20(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1001563A0);
}

- (void)setSetupPayloadWithUri:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC14dockaccessoryd11dockPairing *v12;
  uint64_t v13;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_1001567C0((uint64_t)v10, (uint64_t)v12, (uint64_t)v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  _Block_release(v11);
}

- (void)cancelPairAccessoryWithInfo:(id)a3 completion:(id)a4
{
  sub_100155A20(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_100156A34);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd11dockPairing_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
