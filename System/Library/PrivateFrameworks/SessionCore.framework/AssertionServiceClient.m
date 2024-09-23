@implementation AssertionServiceClient

- (_TtC11SessionCore22AssertionServiceClient)init
{
  _TtC11SessionCore22AssertionServiceClient *result;

  result = (_TtC11SessionCore22AssertionServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore22AssertionServiceClient_assertionManager);
}

- (id)acquire:(id)a3 error:(id *)a4
{
  return sub_1C1419D28(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_1C14197FC);
}

- (BOOL)invalidate:(id)a3 error:(id *)a4
{
  id v5;
  _TtC11SessionCore22AssertionServiceClient *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a3;
  v6 = self;
  v7 = sub_1C14250D8();
  v9 = v8;

  sub_1C14199B0();
  sub_1C13282B4(v7, v9);
  return 1;
}

- (id)reconnect:(id)a3 error:(id *)a4
{
  return sub_1C1419D28(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_1C1419B88);
}

- (void)didInvalidate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC11SessionCore22AssertionServiceClient *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;

  v5 = sub_1C1425DC8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  v11 = sub_1C14250D8();
  v13 = v12;

  v14 = (void *)sub_1C14250CC();
  sub_1C1425DBC();

  sub_1C1419434((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1C13282B4(v11, v13);

}

@end
