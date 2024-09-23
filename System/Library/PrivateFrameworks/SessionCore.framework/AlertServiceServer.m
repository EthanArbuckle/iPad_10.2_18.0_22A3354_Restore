@implementation AlertServiceServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC11SessionCore18AlertServiceServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C13A9DEC(v8);

  swift_unknownObjectRelease();
}

- (_TtC11SessionCore18AlertServiceServer)init
{
  _TtC11SessionCore18AlertServiceServer *result;

  result = (_TtC11SessionCore18AlertServiceServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1339040((uint64_t)self + OBJC_IVAR____TtC11SessionCore18AlertServiceServer_delegate);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)dismissAlertWithActivityIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC11SessionCore18AlertServiceServer *v7;

  v4 = sub_1C1426A88();
  v6 = v5;
  v7 = self;
  sub_1C13A8BE4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)presentAlertWithActivityIdentifier:(id)a3 payload:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  _TtC11SessionCore18AlertServiceServer *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v9 = _Block_copy(a6);
  v10 = sub_1C1426A88();
  v12 = v11;
  v13 = a4;
  v14 = a5;
  v15 = self;
  v16 = sub_1C14250D8();
  v18 = v17;

  v19 = sub_1C14250D8();
  v21 = v20;

  _Block_copy(v9);
  sub_1C13AA254(v10, v12, v16, v18, v19, v21, (char *)v15, v9);
  _Block_release(v9);
  _Block_release(v9);
  sub_1C13282B4(v19, v21);
  sub_1C13282B4(v16, v18);

  swift_bridgeObjectRelease();
}

@end
