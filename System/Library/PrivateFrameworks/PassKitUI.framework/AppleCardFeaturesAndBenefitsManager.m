@implementation AppleCardFeaturesAndBenefitsManager

- (_TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager)init
{
  return (_TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager *)sub_19D39C70C();
}

- (void)dealloc
{
  void *v3;
  _TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_unregisterObserver_, v4);

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for AppleCardFeaturesAndBenefitsManager();
    -[AppleCardFeaturesAndBenefitsManager dealloc](&v7, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager__sectionItems;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A0418);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_paymentDataProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_cardController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_accountUserCollection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_checkmarkColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager_accountCardNumbersPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager____lazy_storage___percentFormatter));
}

- (void)accountChanged:(id)a3
{
  id v5;
  _TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager *v6;

  v5 = a3;
  v6 = self;
  sub_19D3A4EB8(a3);

}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC9PassKitUI35AppleCardFeaturesAndBenefitsManager *v7;

  if (a3)
  {
    v4 = sub_19DE87BF4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_19D3A72B0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  sub_19D3A50FC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &qword_1EE49B408, 0x1E0D66938, &qword_1EE4A03E0);
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  sub_19D3A50FC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &qword_1EE4A03C8, 0x1E0D674C0, (unint64_t *)&unk_1EE4A03D0);
}

@end
