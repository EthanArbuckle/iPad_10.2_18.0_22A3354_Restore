@implementation PaymentPassActionWidgetView.Coordinator

- (void)callIssuer
{
  sub_19D7F0A34((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_call);
}

- (void)openIssuerWebsite
{
  sub_19D7F0A34((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_website);
}

- (void)openBusinessChat
{
  sub_19D7F0A34((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_message);
}

- (_TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator)init
{
  _TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator *result;

  result = (_TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_call));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_website));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_message));
}

@end
