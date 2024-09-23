@implementation InStoreTopUpTokenModel

- (void)dealloc
{
  void *v3;
  _TtC9PassKitUI22InStoreTopUpTokenModel *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel_accountService);
  if (v3)
    objc_msgSend(v3, sel_unregisterObserver_, self);
  else
    v4 = self;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InStoreTopUpTokenModel();
  -[InStoreTopUpTokenModel dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel__state;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B5390);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel__displayableError;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49FDB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  swift_unknownObjectRelease();
}

- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC9PassKitUI22InStoreTopUpTokenModel *v10;

  if (a4)
  {
    v6 = sub_19DE87BF4();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  sub_19D7837E8(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI22InStoreTopUpTokenModel)init
{
  _TtC9PassKitUI22InStoreTopUpTokenModel *result;

  result = (_TtC9PassKitUI22InStoreTopUpTokenModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
