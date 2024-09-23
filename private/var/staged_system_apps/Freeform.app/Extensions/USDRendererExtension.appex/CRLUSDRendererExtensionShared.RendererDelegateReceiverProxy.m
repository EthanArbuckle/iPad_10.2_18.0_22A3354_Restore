@implementation CRLUSDRendererExtensionShared.RendererDelegateReceiverProxy

- (void)rendererStateChanged:(id)a3 state:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = self;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;

  sub_100010D2C(v10, v13, v15);
  sub_100013320(v13, v15);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)rendererStateChangedWithAcknowledge:(id)a3 state:(id)a4 response:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = a4;
  v15 = self;
  v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;

  v19 = swift_allocObject(&unk_100072448, 24, 7);
  *(_QWORD *)(v19 + 16) = v13;
  sub_100011300((uint64_t)v12, v16, v18, (uint64_t)sub_100016348, v19);
  swift_release(v19);
  sub_100013320(v16, v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)rendererSharedTextureChangedXPC:(id)a3 deviceID:(unint64_t)a4 textureHandle:(id)a5 rendererFrameCountHandle:(id)a6 displayerFrameCountHandle:(id)a7 response:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *v24;
  uint64_t v25;

  v15 = type metadata accessor for UUID(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v20 = swift_allocObject(&unk_1000723F8, 24, 7);
  *(_QWORD *)(v20 + 16) = v19;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = self;
  sub_100011A2C((uint64_t)v18, a4, v21, v22, v23, (uint64_t)sub_100013D60, v20);

  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

- (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy)init
{
  _TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *result;

  result = (_TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy *)_swift_stdlib_reportUnimplementedInitializer("USDRendererExtension.RendererDelegateReceiverProxy", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100015698((uint64_t)self+ OBJC_IVAR____TtCO20USDRendererExtension29CRLUSDRendererExtensionShared29RendererDelegateReceiverProxy_delegate);
}

@end
