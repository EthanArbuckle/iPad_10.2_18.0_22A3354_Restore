@implementation SeymourDiscoverySheetCoordinator

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)initWithAppContext:(id)a3 badgingProvider:(id)a4 delegate:(id)a5
{
  char *v7;

  v7 = (char *)a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator *)sub_1000260D0(v7, (uint64_t)a4, a5);
}

- (void)activate
{
  _TtC10FitnessApp32SeymourDiscoverySheetCoordinator *v2;

  v2 = self;
  sub_100014FAC();

}

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)init
{
  _TtC10FitnessApp32SeymourDiscoverySheetCoordinator *result;

  result = (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.SeymourDiscoverySheetCoordinator", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_userDefaults));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_badgingProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_contentAvailabilityClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_engagementClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_privacyPreferenceClient));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_eventHub));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_firstAppLaunchDate;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_lastIntroSheetViewDate, (uint64_t *)&unk_100828370);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_lastWhatsNewSheetViewDate, (uint64_t *)&unk_100828370);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_introSheetConfiguration, &qword_10082C3A0);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_whatsNewSheetConfiguraion, &qword_10082C398);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_contentAvailablity, &qword_10082C3C0);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_noticePrivacyPreference, &qword_10082C3B8);
}

@end
