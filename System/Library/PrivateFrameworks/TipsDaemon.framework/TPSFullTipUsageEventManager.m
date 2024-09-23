@implementation TPSFullTipUsageEventManager

- (void)updateContextualInfoForIdentifiers:(id)a3 tipsDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5
{
  uint64_t v8;
  TPSFullTipUsageEventManager *v9;
  Swift::OpaquePointer_optional v10;
  Swift::OpaquePointer_optional v11;

  v8 = sub_1DACA2E3C();
  if (a4)
    a4 = (id)sub_1DACA2D58();
  if (a5)
    LOBYTE(a5) = sub_1DACA2D58();
  v9 = self;
  v10.value._rawValue = a4;
  v10.is_nil = (char)a5;
  TPSFullTipUsageEventManager.updateContextualInfo(for:tipsDeliveryInfoMap:deliveryInfoMap:)((Swift::OpaquePointer)v8, v10, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)contextualInfoForIdentifier:(id)a3
{
  TPSFullTipUsageEventManager *v3;
  void *v6;

  sub_1DACA2D94();
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028BFE0);
  sub_1DACA2F68();

  swift_bridgeObjectRelease();
  return v6;
}

- (id)contextualInfoMap
{
  TPSFullTipUsageEventManager *v2;
  void *v3;

  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35A8);
  sub_1DACA2F68();

  sub_1DAC3757C(0, &qword_1EDAF3620);
  v3 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)removeUsageEventCache
{
  TPSFullTipUsageEventManager *v2;

  v2 = self;
  TPSFullTipUsageEventManager.removeUsageEventCache()();

}

- (TPSFullTipUsageEventManager)init
{
  return (TPSFullTipUsageEventManager *)TPSFullTipUsageEventManager.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
