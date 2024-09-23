@implementation FundingSourcesModel

- (_TtC9PassKitUI19FundingSourcesModel)init
{
  return (_TtC9PassKitUI19FundingSourcesModel *)sub_19D627024();
}

- (void)dealloc
{
  void *v3;
  _TtC9PassKitUI19FundingSourcesModel *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel_accountService);
  if (v3)
    objc_msgSend(v3, sel_unregisterObserver_, self);
  else
    v4 = self;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FundingSourcesModel(0);
  -[FundingSourcesModel dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__fetchedSources;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AE088);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__availableSources, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__unavailableSources, v4);
  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__loadingSources;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__loaded, v7);
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI19FundingSourcesModel__error;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49FDB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);

}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _TtC9PassKitUI19FundingSourcesModel *v9;

  v5 = (uint64_t)a3;
  if (a3)
  {
    sub_19D1A9ED4(0, &qword_1EE4AE080);
    v5 = sub_19DE87E10();
  }
  if (a4)
  {
    a4 = (id)sub_19DE87BF4();
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  sub_19D6283EC(v5, (uint64_t)a4, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
