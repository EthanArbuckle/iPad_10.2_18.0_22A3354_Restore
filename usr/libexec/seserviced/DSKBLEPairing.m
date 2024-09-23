@implementation DSKBLEPairing

- (_TtC10seserviced13DSKBLEPairing)init
{
  return (_TtC10seserviced13DSKBLEPairing *)sub_1000C3638();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_pairingRequests));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_unpairingRequests));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_currentPairingRequest));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_currentUnpairingRequest));

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TtC10seserviced13DSKBLEPairing *v14;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_1000E31E8((uint8_t *)a3, a4, (uint8_t *)a5);

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  id v7;
  _TtC10seserviced13DSKBLEPairing *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000E3B7C(a4);

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC10seserviced13DSKBLEPairing *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1000E41C4(a4, (uint64_t)a5);

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6;
  id v7;
  _TtC10seserviced13DSKBLEPairing *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000E4748(a4);

}

@end
