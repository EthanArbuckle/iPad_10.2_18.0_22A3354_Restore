@implementation HeadphoneProxFeatureClient

- (_TtP16DaemoniOSLibrary37HPXHeadphoneProxFeatureDeviceProtocol_)delegate
{
  char *v2;
  uint64_t v3;
  _BYTE v5[24];

  v2 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate, v5, 0, 0);
  return (_TtP16DaemoniOSLibrary37HPXHeadphoneProxFeatureDeviceProtocol_ *)(id)swift_unknownObjectWeakLoadStrong(v2, v3);
}

- (void)setDelegate:(id)a3
{
  char *v4;
  _BYTE v5[24];

  v4 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate, v5, 1, 0);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient)init
{
  return (_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *)sub_10027AF7C();
}

- (BOOL)shouldShowWhatsNewCardWithDeviceAddress:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = HeadphoneProxFeatureClient.shouldShowWhatsNewCard(deviceAddress:)(v8);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_manager));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate);
}

@end
