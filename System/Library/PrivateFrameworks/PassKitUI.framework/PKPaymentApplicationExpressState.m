@implementation PKPaymentApplicationExpressState

- (PKPaymentApplication)paymentApplication
{
  return (PKPaymentApplication *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___PKPaymentApplicationExpressState_paymentApplication));
}

- (BOOL)isExpressEnabled
{
  PKPaymentApplicationExpressState *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_19DE85254();
  swift_release();
  swift_release();

  return v5;
}

- (void)setIsExpressEnabled:(BOOL)a3
{
  PKPaymentApplicationExpressState *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_19DE85260();
}

- (PKPaymentApplicationExpressState)initWithPaymentApplication:(id)a3
{
  id v3;
  PKPaymentApplicationExpressState *v4;

  v3 = a3;
  v4 = (PKPaymentApplicationExpressState *)sub_19D3CE8B8(v3);

  return v4;
}

- (PKPaymentApplicationExpressState)init
{
  PKPaymentApplicationExpressState *result;

  result = (PKPaymentApplicationExpressState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___PKPaymentApplicationExpressState__isExpressEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___PKPaymentApplicationExpressState__isPending, v4);
}

@end
