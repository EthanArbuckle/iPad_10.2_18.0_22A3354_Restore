@implementation AlishaPairingExternal

+ (_TtC10seserviced21AlishaPairingExternal)shared
{
  if (qword_100344550 != -1)
    swift_once(&qword_100344550, sub_1000601F0);
  return (_TtC10seserviced21AlishaPairingExternal *)(id)qword_100354A60;
}

- (void)requestOwnerPairingWithSession:(id)a3 delegate:(id)a4
{
  id v6;
  _TtC10seserviced21AlishaPairingExternal *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100060260(v6, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)stopOwnerPairing
{
  _TtC10seserviced21AlishaPairingExternal *v2;

  v2 = self;
  sub_100061FF8((uint64_t)&unk_100306968, (uint64_t)sub_100063ED0, (uint64_t)&unk_100306980);

}

- (void)startHceEmulation
{
  _TtC10seserviced21AlishaPairingExternal *v2;

  v2 = self;
  sub_100061FF8((uint64_t)&unk_100306918, (uint64_t)sub_100063EC8, (uint64_t)&unk_100306930);

}

- (void)stopHceEmulation
{
  _TtC10seserviced21AlishaPairingExternal *v2;

  v2 = self;
  sub_100061FF8((uint64_t)&unk_1003068C8, (uint64_t)sub_100063EC0, (uint64_t)&unk_1003068E0);

}

- (void)startTransactionEmulationFor:(id)a3
{
  sub_10006262C(self, (uint64_t)a2, a3, (uint64_t)&unk_100306878, (uint64_t)sub_100063EB4, (uint64_t)&unk_100306890);
}

- (void)stopTransactionEmulation
{
  _TtC10seserviced21AlishaPairingExternal *v2;

  v2 = self;
  sub_100061FF8((uint64_t)&unk_100306828, (uint64_t)sub_100063E7C, (uint64_t)&unk_100306840);

}

- (void)pairingEndedWithError:(id)a3
{
  _TtC10seserviced21AlishaPairingExternal *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_100061494((uint64_t)a3);

}

- (id)sendAPDU:(id)a3
{
  id v5;
  _TtC10seserviced21AlishaPairingExternal *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = sub_1000617C8(v7, v9);
  sub_100063CD0(v7, v9);

  if (v10)
  {
    v11 = (void *)_convertErrorToNSError(_:)(v10);
    swift_errorRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)readAPDU
{
  _TtC10seserviced21AlishaPairingExternal *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_100061AEC();

  if (v3)
  {
    v4 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)endSession
{
  _TtC10seserviced21AlishaPairingExternal *v2;

  v2 = self;
  sub_100061FF8((uint64_t)&unk_100306788, (uint64_t)sub_100063E0C, (uint64_t)&unk_1003067A0);

}

- (void)startFirstApproachFor:(id)a3
{
  sub_10006262C(self, (uint64_t)a2, a3, (uint64_t)&unk_100306738, (uint64_t)sub_100063D18, (uint64_t)&unk_100306750);
}

- (_TtC10seserviced21AlishaPairingExternal)init
{
  return (_TtC10seserviced21AlishaPairingExternal *)sub_1000631D8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100063F5C((uint64_t)self + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_receivedMessages));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10seserviced21AlishaPairingExternal_session);
}

@end
