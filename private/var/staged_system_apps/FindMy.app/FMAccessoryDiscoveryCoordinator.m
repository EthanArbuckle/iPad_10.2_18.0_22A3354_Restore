@implementation FMAccessoryDiscoveryCoordinator

- (void)dealloc
{
  void *v3;
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *v4;
  id v5;
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *v6;
  NSString v7;
  objc_super v8;

  v3 = (void *)objc_opt_self(NSDistributedNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  v6 = v4;
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "removeObserver:name:object:", v6, v7, 0);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryCoordinator(0);
  -[FMAccessoryDiscoveryCoordinator dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_mediator));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_discoveryController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_pairingCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_onboardingCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_sharingDefaults));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_currentCard);
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_delegate);
  sub_10004FCB8((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_state, type metadata accessor for FMAccessoryDiscoveryCoordinator.State);
  sub_10004FCB8((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_initialEvent, type metadata accessor for FMAccessoryDiscoveryCoordinator.Event);
}

- (void)systemOnboardingStarted
{
  os_log_type_t v2;
  uint64_t v3;
  os_log_type_t v4;
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *v5;

  v5 = self;
  v2 = static os_log_type_t.default.getter(v5);
  sub_10021E80C(v2, 0xD000000000000064, 0x80000001004B6090);
  v4 = static os_log_type_t.default.getter(v3);
  sub_10021E80C(v4, 0xD000000000000038, 0x80000001004B5E30);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC6FindMy31FMAccessoryDiscoveryCoordinator_presenter), "dismissViewControllerAnimated:completion:", 0, 0);
  -[FMAccessoryDiscoveryCoordinator proxCardFlowDidDismiss](v5, "proxCardFlowDidDismiss");

}

- (_TtC6FindMy31FMAccessoryDiscoveryCoordinator)init
{
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *result;

  result = (_TtC6FindMy31FMAccessoryDiscoveryCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryCoordinator", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)proxCardFlowDidDismiss
{
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *v2;

  v2 = self;
  sub_10021D0B4();

}

- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4
{
  id v5;
  _TtC6FindMy31FMAccessoryDiscoveryCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_10021E994((uint64_t)v6);

}

@end
