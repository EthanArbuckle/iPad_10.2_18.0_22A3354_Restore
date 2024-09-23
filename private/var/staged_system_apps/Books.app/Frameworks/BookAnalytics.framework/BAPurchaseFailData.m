@implementation BAPurchaseFailData

- (BAPurchaseFailData)initWithPurchaseFailureReason:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6
{
  uint64_t v10;
  SEL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  objc_super v18;

  if (!a5)
  {
    v10 = 0;
    v11 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v13 = 0;
    goto LABEL_6;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, a2);
  v11 = a2;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, a2);
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseFailData_purchaseFailureReason) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BAPurchaseFailData_errorCode) = (Class)a4;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseFailData_errorDescription);
  *v14 = v10;
  v14[1] = (uint64_t)v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___BAPurchaseFailData_errorDomain);
  *v15 = v12;
  v15[1] = v13;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for BridgedPurchaseFailData();
  v16 = a4;
  return -[BAPurchaseFailData init](&v18, "init");
}

- (BAPurchaseFailData)init
{
  BAPurchaseFailData *result;

  result = (BAPurchaseFailData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedPurchaseFailData", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->purchaseFailureReason[OBJC_IVAR___BAPurchaseFailData_errorDescription]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->purchaseFailureReason[OBJC_IVAR___BAPurchaseFailData_errorDomain]);
}

@end
