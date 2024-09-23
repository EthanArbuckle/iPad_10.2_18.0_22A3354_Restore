@implementation LocalFindableConnectionMaterialTrampoline

- (void)startLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  void *v4;
  _TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1007DDFEC(v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)stopLocalFindableConnectionMaterialMonitoringWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *v12;
  uint64_t v13;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101093CA0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101093CC8, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_10001D1F0;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_100691AC0((uint64_t)v7, (uint64_t)&unk_101109A88, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  void (**v24)(uint64_t, uint64_t);
  _TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *v25;
  uint64_t v26;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v26 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_101093C50, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v20 = *(unsigned __int8 *)(v11 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject(&unk_101093C78, v22 + 16, v20 | 7);
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  *((_QWORD *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v21], v14, v10);
  v24 = (void (**)(uint64_t, uint64_t))&v23[v22];
  *v24 = sub_10015A53C;
  v24[1] = (void (*)(uint64_t, uint64_t))v18;
  v25 = self;
  swift_retain();
  sub_100626BC4((uint64_t)v9, (uint64_t)&unk_101109A70, (uint64_t)v23);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (_TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline)init
{
  _TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *result;

  result = (_TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.LocalFindableConnectionMaterialTrampoline", 54, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12searchpartyd41LocalFindableConnectionMaterialTrampoline_implementation));
}

@end
