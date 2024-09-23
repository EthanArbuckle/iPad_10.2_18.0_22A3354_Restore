@implementation AccountDebugModel

- (_TtC9PassKitUI17AccountDebugModel)init
{
  _TtC9PassKitUI17AccountDebugModel *result;

  result = (_TtC9PassKitUI17AccountDebugModel *)_swift_stdlib_reportUnimplementedInitializer();
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
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  char *v19;
  uint64_t v20;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__cardAccount;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B9480);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__inProgress;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__status;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A9E90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__transactionGroups;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4B1BE0);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v12 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__runningBalance;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A4600);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__statements;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B1BF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__ckTransactions;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B1BF8);
  v18 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8);
  v18(v16, v17);
  v19 = (char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__ckRewards;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B1C00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  v18((char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__cardTransactions, v17);
  v11((char *)self + OBJC_IVAR____TtC9PassKitUI17AccountDebugModel__invalidBalanceIncrements, v10);

}

@end
