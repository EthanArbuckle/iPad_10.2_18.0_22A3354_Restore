@implementation TransactionsModel

- (void)dealloc
{
  _TtC9PassKitUI17TransactionsModel *v2;

  v2 = self;
  TransactionsModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel_calendar;
  v4 = sub_19DE83CB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__transactions;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B9468);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__yearlyGroups;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4B9470);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__monthlyGroups, v8);
  v10 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__notificationServiceUpdatesEnabled;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__account;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B9480);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__appleCardDetailInfo;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B9488);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC9PassKitUI17TransactionsModel__transactionSourceCollection;
  v17 = __swift_instantiateConcreteTypeFromMangledName(qword_1EE4B9490);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);

  swift_bridgeObjectRelease();
}

- (void)transactionsChanged:(id)a3
{
  void *v4;
  _TtC9PassKitUI17TransactionsModel *v5;
  Swift::OpaquePointer_optional v6;

  if (a3)
  {
    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4AA970);
    v4 = (void *)sub_19DE87E10();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  v6.value._rawValue = v4;
  TransactionsModel.transactionsChanged(_:)(v6);

  swift_bridgeObjectRelease();
}

- (void)accountDidUpdate
{
  _TtC9PassKitUI17TransactionsModel *v2;

  v2 = self;
  sub_19D82BA8C();

}

- (void)passSettingsDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9PassKitUI17TransactionsModel *v9;
  uint64_t v10;

  v4 = sub_19DE833D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19DE833B8();
  v9 = self;
  sub_19D82BE94();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC9PassKitUI17TransactionsModel)init
{
  _TtC9PassKitUI17TransactionsModel *result;

  result = (_TtC9PassKitUI17TransactionsModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
