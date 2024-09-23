@implementation UrsaClient

- (_TtC21PowerlogLiteOperators10UrsaClient)initWith:(BOOL)a3
{
  return (_TtC21PowerlogLiteOperators10UrsaClient *)UrsaClient.init(_:)(a3);
}

- (void)submitUrsaWith:(id)a3 build:(id)a4 device:(id)a5 flag:(id)a6 fetchStartTime:(double)a7 requestId:(id)a8 completion:(id)a9
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _TtC21PowerlogLiteOperators10UrsaClient *v26;
  uint64_t v27;
  uint64_t v28;

  v10 = _Block_copy(a9);
  v28 = sub_1CB360960();
  v12 = v11;
  v27 = sub_1CB360960();
  v14 = v13;
  v15 = sub_1CB360960();
  v17 = v16;
  v18 = sub_1CB360960();
  v20 = v19;
  v21 = sub_1CB360960();
  v23 = v22;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v10;
  v26 = self;
  UrsaClient.submitUrsa(_:_:_:_:_:_:_:)(v28, v12, v27, v14, v15, v17, v18, v20, a7, v21, v23, (uint64_t)sub_1CAFBD95C, v24);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)cancel
{
  _TtC21PowerlogLiteOperators10UrsaClient *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21PowerlogLiteOperators10UrsaClient_currentTask))
  {
    v2 = self;
    swift_retain();
    sub_1CB360A2C();

    swift_release();
  }
}

- (_TtC21PowerlogLiteOperators10UrsaClient)init
{
  _TtC21PowerlogLiteOperators10UrsaClient *result;

  result = (_TtC21PowerlogLiteOperators10UrsaClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
