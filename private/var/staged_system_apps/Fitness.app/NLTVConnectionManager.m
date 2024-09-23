@implementation NLTVConnectionManager

- (id)presenter:(id)a3 userNotificationCenter:(id)a4
{
  id v6;
  char *v7;

  swift_unknownObjectRetain(a3);
  v6 = a4;
  v7 = sub_100023CB0((uint64_t)a3, v6);
  swift_unknownObjectRelease(a3);

  return v7;
}

- (void)updateDiscoveryStateIfNeeded
{
  NLTVConnectionManager *v2;

  v2 = self;
  sub_100024134();

}

- (void)setIsDiscoveryAllowed:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_isDiscoveryAllowed) = a3;
}

- (BOOL)isDiscoveryAllowed
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_isDiscoveryAllowed);
}

- (void)beginDiscovery
{
  NLTVConnectionManager *v2;

  v2 = self;
  sub_1000146A8();

}

- (void)endDiscovery
{
  NLTVConnectionManager *v2;

  v2 = self;
  sub_100468950();

}

- (void)connectAutomatically
{
  NLTVConnectionManager *v2;

  v2 = self;
  sub_100468EC4();

}

- (NLTVConnectionManager)init
{
  NLTVConnectionManager *result;

  result = (NLTVConnectionManager *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TVConnectionManager", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___NLTVConnectionManager_participantClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___NLTVConnectionManager_browsingClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___NLTVConnectionManager_sessionClient));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_eventHub));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_subscriptionToken));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_presenter);
  sub_1000242F8((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_state);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_dependencies));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___NLTVConnectionManager_guestPairingNotificationCoordinator));
}

@end
