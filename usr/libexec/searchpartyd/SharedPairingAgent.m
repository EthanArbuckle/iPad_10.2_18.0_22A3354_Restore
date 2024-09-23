@implementation SharedPairingAgent

- (void)dealloc
{
  _TtC12searchpartyd18SharedPairingAgent *v2;

  v2 = self;
  sub_100BF3DA8();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd18SharedPairingAgent_lock));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd18SharedPairingAgent_pairingSubjects));
}

- (_TtC12searchpartyd18SharedPairingAgent)init
{
  _TtC12searchpartyd18SharedPairingAgent *result;

  result = (_TtC12searchpartyd18SharedPairingAgent *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.SharedPairingAgent", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC12searchpartyd18SharedPairingAgent *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100BF6020(a4, (uint64_t)a5, "peerDidFailToCompletePairing: %{public}s. %{public}@", (uint64_t)sub_100BF64A4, "peerDidFailToCompletePairing: peer cannot be nil!");

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  id v7;
  _TtC12searchpartyd18SharedPairingAgent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100BF5BD8(a4);

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC12searchpartyd18SharedPairingAgent *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_100BF6020(a4, a5, "peerDidRequestPairing: %{public}s. %{public}@", (uint64_t)sub_100BF6470, "peerDidRequestPairing: peer cannot be nil!");

}

@end
