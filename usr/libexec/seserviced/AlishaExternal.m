@implementation AlishaExternal

+ (_TtC10seserviced14AlishaExternal)shared
{
  if (qword_100344740 != -1)
    swift_once(&qword_100344740, sub_1001D9570);
  return (_TtC10seserviced14AlishaExternal *)(id)qword_100354E48;
}

- (id)getAllEndpoints
{
  uint64_t v2;
  Class isa;

  v2 = sub_1001DE72C((uint64_t)self, (uint64_t)a2);
  sub_10006C25C(0, (unint64_t *)&qword_100347710, SEEndPoint_ptr);
  sub_10007EFD8();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (id)getEndpointWithKeyIdentifier:(id)a3
{
  return sub_1001D9654(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_1001DD6B4);
}

- (id)getEndpointWithReaderIdentifier:(id)a3
{
  return sub_1001D9654(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, uint64_t, unint64_t))sub_1001DDE7C);
}

- (BOOL)isPassiveEntryAvailableFor:(id)a3
{
  id v5;
  _TtC10seserviced14AlishaExternal *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  LOBYTE(v5) = sub_1001DE7E4(v7, v9);
  sub_100063CD0(v7, v9);

  return v5 & 1;
}

- (BOOL)isPeerConnectedWithClientUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  LOBYTE(a3) = sub_1001DE920((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return a3 & 1;
}

- (id)cancelRKERequestWithFunctionIdentifier:(unsigned __int16)a3 keyIdentifier:(id)a4
{
  id v7;
  _TtC10seserviced14AlishaExternal *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  v7 = a4;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;

  v12 = (void *)sub_1001DEA50(a3, v9, v11);
  sub_100063CD0(v9, v11);

  return v12;
}

- (id)continueExecutingRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6
{
  id v7;
  id v11;
  _TtC10seserviced14AlishaExternal *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  _TtC10seserviced14AlishaExternal *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;

  v7 = a5;
  if (a5)
  {
    v11 = a6;
    v12 = self;
    v13 = v7;
    v7 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v15 = v14;

  }
  else
  {
    v16 = a6;
    v17 = self;
    v15 = 0xF000000000000000;
  }
  v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v20 = v19;

  v21 = (void *)sub_1001DEBA0(a3, a4, (uint64_t)v7, v15, v18, v20);
  sub_100063CD0(v18, v20);
  sub_10006B9B4((uint64_t)v7, v15);

  return v21;
}

- (id)getReportsWithIsInternalClient:(BOOL)a3
{
  uint64_t v3;
  Class isa;

  v3 = sub_1001DED10(a3);
  sub_10006C25C(0, &qword_10034A250, SESVehicleReport_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)sendPassthroughWithMessage:(id)a3 clientUUID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC10seserviced14AlishaExternal *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v20;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v18 = (void *)sub_1001DEE50(v15, v17, (uint64_t)v11);
  sub_100063CD0(v15, v17);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v18;
}

- (id)getEnduringRKERequestsInProgress
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _TtC10seserviced14AlishaExternal *v9;
  uint64_t v10;
  id v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v16;
  uint64_t v17;

  v3 = type metadata accessor for DispatchPredicate(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = qword_1003447B8;
  v9 = self;
  if (v8 != -1)
    swift_once(&qword_1003447B8, sub_1001EEFA4);
  v10 = qword_100354EE8;
  *v7 = qword_100354EE8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for DispatchPredicate.notOnQueue(_:), v3);
  v11 = (id)v10;
  LOBYTE(v10) = _dispatchPreconditionTest(_:)(v7);
  result = (id)(*(uint64_t (**)(_QWORD *, uint64_t))(v4 + 8))(v7, v3);
  if ((v10 & 1) != 0)
  {
    v13 = sub_100063D3C(&qword_10034A240);
    OS_dispatch_queue.sync<A>(execute:)(&v17, sub_1001DB348, 0, v13);

    v14 = v17;
    type metadata accessor for AlishaExternal.RequestInProgress();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    return isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)sendRKERequestWithFunctionIdentifier:(unsigned __int16)a3 actionIdentifier:(unsigned __int8)a4 keyIdentifier:(id)a5 requestType:(unint64_t)a6 enduringRequestHandler:(id)a7 authorization:(id)a8 completion:(id)a9
{
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _TtC10seserviced14AlishaExternal *v28;

  v14 = _Block_copy(a7);
  v15 = _Block_copy(a9);
  v16 = a5;
  v28 = self;
  v17 = a8;
  v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;

  if (!v14)
  {
    v22 = 0;
    v21 = 0;
    if (v17)
      goto LABEL_3;
LABEL_5:
    v23 = 0;
    v25 = 0xF000000000000000;
    goto LABEL_6;
  }
  v21 = swift_allocObject(&unk_10030D8D0, 24, 7);
  *(_QWORD *)(v21 + 16) = v14;
  v22 = sub_1001E02F0;
  if (!v17)
    goto LABEL_5;
LABEL_3:
  v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a8);
  v25 = v24;

LABEL_6:
  v26 = swift_allocObject(&unk_10030D8A8, 24, 7);
  *(_QWORD *)(v26 + 16) = v15;
  sub_1001DEFA0(a3, a4, v18, v20, a6, (uint64_t)v22, v21, v23, v25, (uint64_t)sub_1001E02DC, v26);
  swift_release(v26);
  sub_10006B9B4(v23, v25);
  sub_10008F210((uint64_t)v22, v21);
  sub_100063CD0(v18, v20);

}

- (void)pauseRangingFor:(id)a3
{
  sub_1001DC8F4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10030D858, (uint64_t)sub_1001E0248, (uint64_t)&unk_10030D870);
}

- (void)onAssertionAcquiredWithIdentifier:(id)a3 for:(id)a4
{
  sub_1001DC640(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_10030D7B8, (uint64_t)sub_1001E0218, (uint64_t)&unk_10030D7D0);
}

- (void)onAssertionReleasedWithIdentifier:(id)a3 for:(id)a4
{
  sub_1001DC640(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_10030D718, (uint64_t)sub_1001E01D8, (uint64_t)&unk_10030D730);
}

- (void)resetDisconnectionHistoryFor:(id)a3
{
  sub_1001DC8F4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10030D678, (uint64_t)sub_1001E017C, (uint64_t)&unk_10030D690);
}

- (void)subscribeToVehicleFunctionStatusEventsWithRange:(_NSRange)a3 peerUUID:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  length = a3.length;
  location = a3.location;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_1001DF650(location, length, (uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (void)addHighPriorityRequestFor:(id)a3 client:(id)a4
{
  sub_1001DCE68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_10030D588, (uint64_t)sub_1001E0044, (uint64_t)&unk_10030D5A0);
}

- (void)removeHighPriorityRequestFor:(id)a3 client:(id)a4
{
  sub_1001DCE68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_10030D538, (uint64_t)sub_1001DFFBC, (uint64_t)&unk_10030D550);
}

- (void)sendDeviceIntentFor:(id)a3
{
  sub_1001DD4C8(self, (uint64_t)a2, a3, (uint64_t)&unk_10030D498, (uint64_t)sub_1001DFFAC, (uint64_t)&unk_10030D4B0);
}

- (void)triggerHeadUnitPairingWith:(id)a3 keyIdentifier:(id)a4
{
  id v5;
  id v6;
  _TtC10seserviced14AlishaExternal *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC10seserviced14AlishaExternal *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v5 = a3;
  if (a3)
  {
    v6 = a4;
    v7 = self;
    v8 = v5;
    v5 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v10 = v9;

  }
  else
  {
    v11 = a4;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;

  sub_1001DFB1C((uint64_t)v5, v10, v13, v15);
  sub_100063CD0(v13, v15);
  sub_10006B9B4((uint64_t)v5, v10);

}

- (void)onTrackingCompleteFor:(id)a3
{
  sub_1001DD4C8(self, (uint64_t)a2, a3, (uint64_t)&unk_10030D3A8, (uint64_t)sub_1001DFF18, (uint64_t)&unk_10030D3C0);
}

- (_TtC10seserviced14AlishaExternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[AlishaExternal init](&v3, "init");
}

@end
