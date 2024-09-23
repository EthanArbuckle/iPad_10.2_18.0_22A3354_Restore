@implementation PKPeerPaymentCounterpartImageResolver

- (PKPeerPaymentCounterpartImageResolver)init
{
  return (PKPeerPaymentCounterpartImageResolver *)PeerPaymentCounterpartImageResolver.init()();
}

- (BOOL)hasCachedImageDataForIdentifier:(id)a3
{
  void *v4;
  PKPeerPaymentCounterpartImageResolver *v5;
  void *v6;
  id v7;

  sub_19DE87BF4();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPeerPaymentCounterpartImageResolver_cache);
  v5 = self;
  v6 = (void *)sub_19DE87BD0();
  v7 = objc_msgSend(v4, sel_objectForKey_, v6);

  swift_bridgeObjectRelease();
  if (v7)

  return v7 != 0;
}

- (id)counterpartImageDataForIdentifier:(id)a3
{
  void *v4;
  PKPeerPaymentCounterpartImageResolver *v5;
  void *v6;
  id v7;

  sub_19DE87BF4();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPeerPaymentCounterpartImageResolver_cache);
  v5 = self;
  v6 = (void *)sub_19DE87BD0();
  v7 = objc_msgSend(v4, sel_objectForKey_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (void)counterpartImageDataForIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKPeerPaymentCounterpartImageResolver *v10;

  v5 = _Block_copy(a4);
  v6 = sub_19DE87BF4();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_19D454FD4(v6, v8, (uint64_t)sub_19D22E97C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void).cxx_destruct
{

}

@end
