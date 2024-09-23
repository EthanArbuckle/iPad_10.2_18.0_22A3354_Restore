@implementation ClassicPairingSupport

- (void)pairedDeviceNameChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v9[16];
  _TtC12searchpartyd21ClassicPairingSupport *v10;
  _BYTE *v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v9[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  type metadata accessor for Transaction(0);
  v10 = self;
  v11 = v8;
  swift_retain();
  static Transaction.named<A>(_:with:)("searchpartyd.ClassicPairingSupport.pairedDeviceNameChanged", 58, 2, sub_1002DFB90, v9);
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

@end
