@implementation PeerPaymentAmountEntryKeypadView.Coordinator

- (id)minimumTransferAmount
{
  return sub_19D553BF4((char *)self, (uint64_t)a2, (SEL *)&selRef_minimumAmount);
}

- (id)maximumTransferAmount
{
  return sub_19D553BF4((char *)self, (uint64_t)a2, (SEL *)&selRef_maximumAmount);
}

- (id)currentBalance
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator_peerPaymentAccount), sel_currentBalance);
}

- (double)percentExpanded
{
  return 1.0;
}

- (void)amountDidChangeTo:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A8C78);
    sub_19DE876A8();
  }
  else
  {
    __break(1u);
  }
}

- (void)memoDidChangeTo:(id)a3
{
  uint64_t v3;

  if (a3)
    sub_19DE87BF4();
  else
    v3 = 0;
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A8C80);
    sub_19DE876A8();
  }
  else
  {
    __break(1u);
  }
}

- (_TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator)init
{
  _TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator *result;

  result = (_TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator_peerPaymentAccount));

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
