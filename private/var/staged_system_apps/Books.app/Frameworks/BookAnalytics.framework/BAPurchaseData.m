@implementation BAPurchaseData

- (BAPurchaseData)initWithPurchaseAttemptID:(id)a3 purchaseMethod:(int64_t)a4 isPreorder:(BOOL)a5 pricingParameters:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, v11);
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseData_purchaseAttemptID);
  *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseData_purchaseMethod) = (Class)a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAPurchaseData_isPreorder) = a5;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseData_pricingParameters);
  *v15 = v13;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for BridgedPurchaseData();
  return -[BAPurchaseData init](&v18, "init");
}

- (BAPurchaseData)init
{
  BAPurchaseData *result;

  result = (BAPurchaseData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedPurchaseData", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_B2BF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BAPurchaseData_purchaseAttemptID, &OBJC_IVAR___BAPurchaseData_pricingParameters);
}

@end
