@implementation BankConnectAccountCredentialsViewControllerProvider

+ (id)makeViewControllerWithAccountCredentials:(id)a3 title:(id)a4
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  _BYTE v12[56];

  sub_19D2E5908();
  v4 = sub_19DE87E10();
  v5 = sub_19DE87BF4();
  v7 = v6;
  v8 = sub_19D2E51A8(v4);
  sub_19DE82F08();
  sub_19D2F5E9C(v8, v5, v7, (uint64_t)v12);
  swift_bridgeObjectRelease();
  v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE49B608));
  v10 = (void *)sub_19DE864D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC9PassKitUI51BankConnectAccountCredentialsViewControllerProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectAccountCredentialsViewControllerProvider();
  return -[BankConnectAccountCredentialsViewControllerProvider init](&v3, sel_init);
}

@end
