@implementation PKExpressPaymentOptionsViewHosting

+ (id)createExpressPaymentOptionsViewHostingControllerWithPass:(id)a3 eligibleExpressUpgradeRequests:(id)a4 currentExpressPassInfo:(id)a5 updateExpressStateHandler:(id)a6
{
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v8 = _Block_copy(a6);
  sub_19D1A9ED4(0, &qword_1EE4A1108);
  v9 = sub_19DE87E10();
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v10 = a3;
  v11 = a5;
  sub_19D3CE9D4(v10, v9);
  v12 = v10;
  sub_19DE82CB0();
  sub_19DE8754C();
  v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A1020));
  v14 = (void *)sub_19DE864D8();

  swift_bridgeObjectRelease();
  swift_release();
  return v14;
}

- (PKExpressPaymentOptionsViewHosting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpressPaymentOptionsViewHosting();
  return -[PKExpressPaymentOptionsViewHosting init](&v3, sel_init);
}

@end
