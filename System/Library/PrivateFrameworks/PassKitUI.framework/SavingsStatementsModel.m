@implementation SavingsStatementsModel

- (_TtC9PassKitUI22SavingsStatementsModel)init
{
  _TtC9PassKitUI22SavingsStatementsModel *result;

  result = (_TtC9PassKitUI22SavingsStatementsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI22SavingsStatementsModel__statements;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49FDA8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI22SavingsStatementsModel__displayableError;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49FDB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI22SavingsStatementsModel__loading;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
