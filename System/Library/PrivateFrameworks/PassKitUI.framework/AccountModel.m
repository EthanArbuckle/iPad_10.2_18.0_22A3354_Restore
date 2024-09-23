@implementation AccountModel

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9PassKitUI12AccountModel *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI12AccountModel_accountService);
  if (v4)
    objc_msgSend(v4, sel_unregisterObserver_, self);
  else
    v5 = self;
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[AccountModel dealloc](&v6, sel_dealloc);
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__account;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__savingsDetails;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__savingsSummary;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__appleBalanceDetails;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__appleBalanceSummary;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__observableBalance;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B5D8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__isNewAccount;
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  v17 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
  v17(v15, v16);
  v17((char *)self + OBJC_IVAR____TtC9PassKitUI12AccountModel__expectingAccountUpdate, v16);

}

- (void)accountChanged:(void *)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v5 = a1;
    v4 = a3;
    sub_19D2E29E4(v4);

  }
  else
  {
    __break(1u);
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  __int16 v5;
  _TtC9PassKitUI12AccountModel *v6;

  v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  v6 = self;
  sub_19D2E3ED8(v5);
  swift_unknownObjectRelease();

}

- (_TtC9PassKitUI12AccountModel)init
{
  _TtC9PassKitUI12AccountModel *result;

  result = (_TtC9PassKitUI12AccountModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
