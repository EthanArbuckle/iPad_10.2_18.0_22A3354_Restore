@implementation CRLFollowAccessibilityExperienceCoordinator

- (id)initFor:(id)a3
{
  return sub_100998548(a3);
}

- (void)dealloc
{
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v2;

  v2 = self;
  sub_10099879C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_followCoordinator);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_mostRecentViewportState, &qword_1013EE2E0);
  sub_1004CB800((uint64_t)self+ OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_mostRecentAnnouncedViewportState, &qword_1013EE2E0);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_lastFollowedParticipant);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_hosts));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_viewportChangeDebounceTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_voiceOverRepRefocusTimer));
}

- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator
{
  return (_TtC8Freeform20CRLFollowCoordinator *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_followCoordinator);
}

- (void)setFollowCoordinator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_followCoordinator, a3);
}

- (_TtC8Freeform27CRLCollaborationParticipant)lastFollowedParticipant
{
  return (_TtC8Freeform27CRLCollaborationParticipant *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_lastFollowedParticipant);
}

- (void)setLastFollowedParticipant:(id)a3
{
  id v5;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1009989F4(a3);

}

- (void)registerHost:(id)a3 andFocus:(BOOL)a4
{
  id v6;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_100998B20(v6, a4);

}

- (void)submitEventForSelectionOf:(id)a3
{
  id v4;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100999688(v4);

}

- (void)submitEventForEditOf:(id)a3
{
  id v4;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1009998F0(v4);

}

- (BOOL)requestPauseFollow
{
  void *Strong;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v4;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_followCoordinator);
  if (Strong)
  {
    v4 = self;
    sub_1006F51D0(1);

  }
  return Strong != 0;
}

- (BOOL)requestRefollowLastFollowedParticipant
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_followCoordinator);
  if (!Strong)
    return 0;
  v4 = (void *)Strong;
  v5 = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_lastFollowedParticipant);
  v6 = v5 != 0;
  if (v5)
  {
    v7 = (void *)v5;
    v8 = self;
    sub_1006F63B4(v7, 0);

  }
  return v6;
}

- (id)makeAccessibilityHistoryActionsFor:(id)a3
{
  id v4;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  sub_100999D08(v4);

  sub_1004B8930(0, &qword_1013E78E8, UIAccessibilityCustomAction_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

+ (NSString)magicTapInstruction
{
  NSString v2;

  if (qword_1013DD608 != -1)
    swift_once(&qword_1013DD608, sub_10099AE2C);
  swift_bridgeObjectRetain(*(_QWORD *)algn_1014800F8);
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)crlaxInstructions
{
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10099AFEC();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)prepareForViewportChange
{
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v2;

  v2 = self;
  sub_10099B358();

}

- (void)accessibilityStatusDidChange
{
  void *v3;
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *v4;

  v3 = (void *)objc_opt_self(CRLAccessibility);
  v4 = self;
  if (objc_msgSend(v3, "isVoiceOverOrSwitchControlEnabled"))
    sub_100998FC8();
  else
    sub_100999494();

}

- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)init
{
  _TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *result;

  result = (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLFollowAccessibilityExperienceCoordinator", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
