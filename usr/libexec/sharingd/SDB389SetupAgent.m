@implementation SDB389SetupAgent

+ (_TtC16DaemoniOSLibrary16SDB389SetupAgent)shared
{
  if (qword_1007B42B0 != -1)
    swift_once(&qword_1007B42B0, sub_100533B38);
  return (_TtC16DaemoniOSLibrary16SDB389SetupAgent *)(id)static SDB389SetupAgent.shared;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_queue));
}

- (_TtC16DaemoniOSLibrary16SDB389SetupAgent)init
{
  return (_TtC16DaemoniOSLibrary16SDB389SetupAgent *)sub_100533C60();
}

- (void)activate
{
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v2;

  v2 = self;
  SDB389SetupAgent.activate()();

}

- (void)advertisingB389Found:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v5;

  v4 = a3;
  v5 = self;
  SDB389SetupAgent.advertisingB389Found(_:)(v4);

}

- (void)advertisingB389Lost:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v10;
  uint64_t v11;

  v5 = sub_100008384(&qword_1007B7280);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  SDB389SetupAgent.advertisingB389Lost(_:)((uint64_t)v7);

  sub_10000D0F0((uint64_t)v7, &qword_1007B7280);
}

- (void)showNFCPromptWithConfig:(id)a3 responseHandler:(id)a4
{
  void *v6;
  id v7;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v8;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  _s16DaemoniOSLibrary16SDB389SetupAgentC23showNFCPromptWithConfig_15responseHandlerySo06SFB389G13ConfigurationC_ys5Error_pSg_SdSo0L11NFCResponseVtctF_0(v7);
  _Block_release(v6);

}

- (CUXPCAgentConnection)nfcXPCCnx
{
  return (CUXPCAgentConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx));
}

- (void)setNfcXPCCnx:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcXPCCnx) = (Class)a3;
  v3 = a3;

}

- (void)updateNFCPromptConfig:(id)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10072E870, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10053A040;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  SDB389SetupAgent.updateNFCPromptConfig(_:responseHandler:)(a3, (uint64_t)v6, v7);
  sub_1002845F4((uint64_t)v6, v7);

}

- (void)dismissNFCPrompt
{
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v2;
  id v3;

  v2 = self;
  SDB389SetupAgent.updateNFCPromptConfig(_:responseHandler:)(0, 0, 0);
  v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcConfig);
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcConfig) = 0;

}

- (void).cxx_destruct
{

  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcResponseHandler), *(_QWORD *)&self->alertHandle[OBJC_IVAR____TtC16DaemoniOSLibrary16SDB389SetupAgent_nfcResponseHandler]);
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v7;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v8;

  v7 = _Block_copy(a5);
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v8 = self;
  _Block_release(v7);

  swift_bridgeObjectRelease(a4);
}

- (uint64_t)contactIDForEmailHash:(uint64_t)a3 phoneHash:(uint64_t)a4 completion:(void *)aBlock
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v8 = _Block_copy(aBlock);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v9;
  }
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  v11 = a1;
  _Block_release(v8);

  swift_bridgeObjectRelease(a3);
  return swift_bridgeObjectRelease(a4);
}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
}

- (void)retriggerProximitySetup:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)setupDevice:(id)a3 homeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = sub_100008384(&qword_1007B7280);
  __chkstk_darwin(v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  _Block_release(v10);
  sub_10000D0F0((uint64_t)v9, &qword_1007B7280);
}

- (uint64_t)openSetupURL:(uint64_t)a3 completion:(const void *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_release(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v5;

  v4 = a3;
  v5 = self;
  SDB389SetupAgent.remoteAlertHandleDidActivate(_:)(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100539C30((uint64_t)a4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary16SDB389SetupAgent *v5;

  v4 = a3;
  v5 = self;
  SDB389SetupAgent.remoteAlertHandleDidDeactivate(_:)(v4);

}

@end
