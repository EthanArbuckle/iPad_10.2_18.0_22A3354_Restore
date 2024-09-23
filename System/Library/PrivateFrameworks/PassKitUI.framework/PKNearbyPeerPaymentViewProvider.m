@implementation PKNearbyPeerPaymentViewProvider

- (id)amountEntryViewWithInitialAmount:(id)a3 initialMemo:(id)a4 dismissAction:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  PKNearbyPeerPaymentViewProvider *v13;
  id v14;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_19DE87BF4();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  v14 = (id)sub_19D696A10(a3, v9, (unint64_t)a4, (uint64_t)sub_19D696C78, v11);

  swift_release();
  swift_bridgeObjectRelease();
  return v14;
}

- (PKNearbyPeerPaymentViewProvider)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKNearbyPeerPaymentViewProvider_amountEntryVC) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbyPeerPaymentViewProvider();
  return -[PKNearbyPeerPaymentViewProvider init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
