@implementation FMAccessoryPairingCoordinator

- (_TtC6FindMy29FMAccessoryPairingCoordinator)init
{
  _TtC6FindMy29FMAccessoryPairingCoordinator *result;

  result = (_TtC6FindMy29FMAccessoryPairingCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryPairingCoordinator", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_mediator));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_accessory;
  v4 = type metadata accessor for FMIPDiscoveredAccessory(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_pairingController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_pairingWatchdog));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_devicesSubscription));
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_startDate;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_currentCard);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_presenter);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_delegate);
  sub_10004FCB8((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMAccessoryPairingCoordinator_state, type metadata accessor for FMAccessoryPairingCoordinator.State);
}

- (void)proxCardFlowDidDismiss
{
  _TtC6FindMy29FMAccessoryPairingCoordinator *v2;

  v2 = self;
  sub_1000F682C();

}

@end
