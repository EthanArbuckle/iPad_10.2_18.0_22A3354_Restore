@implementation CRLPersistentFollowHUDController

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView));
}

- (void)setHudView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView) = (Class)a3;
  v3 = a3;

}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView));
}

- (void)setContainerView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView) = (Class)a3;
  v3 = a3;

}

- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager
{
  return (_TtP8Freeform23CRLStatusHUDManaging_mi_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_manager);
}

- (void)setManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_manager, a3);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_type);
}

- (NSString)message
{
  _TtC8Freeform32CRLPersistentFollowHUDController *v2;
  NSString v3;

  v2 = self;
  sub_1007EFA6C();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_maximumShowDuration) = a3;
}

- (NSDate)timeStartedShowing
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_1004B804C(&qword_1013E04F0);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, &qword_1013E04F0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setTimeStartedShowing:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform32CRLPersistentFollowHUDController *v11;
  _BYTE v13[24];

  v5 = sub_1004B804C(&qword_1013E04F0);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing, v13, 33, 0);
  v11 = self;
  sub_10056AFBC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (double)timeLeftToShow
{
  return 0.0;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideTimer) = (Class)a3;
  v3 = a3;

}

- (BOOL)showing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_showing);
}

- (void)setShowing:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_showing) = a3;
}

- (BOOL)animating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_animating) = a3;
}

- (BOOL)hiding
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessibilityAnnouncement:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement);
  v7 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityAnnouncement];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)swipable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (BOOL)hideOnTouch
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint) = (Class)a3;
  v3 = a3;

}

- (void)stopButtonClickedWithSender:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform32CRLPersistentFollowHUDController *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler);
  if (v3)
  {
    v6 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler];
    swift_unknownObjectRetain(a3);
    v8 = self;
    v7 = sub_1004C0F54((uint64_t)v3, v6);
    v3(v7);
    sub_1004C1024((uint64_t)v3, v6);
    swift_unknownObjectRelease(a3);

  }
}

- (_TtC8Freeform32CRLPersistentFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 accessibilityExperienceCoordinator:(id)a7 stopButtonClickedHandler:(id)a8
{
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v14 = _Block_copy(a8);
  if (v14)
  {
    v15 = swift_allocObject(&unk_101280500, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_100565828;
  }
  else
  {
    v15 = 0;
  }
  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v16 = a4;
  swift_unknownObjectRetain(a5);
  v17 = a7;
  return (_TtC8Freeform32CRLPersistentFollowHUDController *)sub_1007F1A6C((uint64_t)a3, v16, (uint64_t)a5, a7, (uint64_t)v14, v15, self, a6);
}

- (_TtC8Freeform32CRLPersistentFollowHUDController)init
{
  _TtC8Freeform32CRLPersistentFollowHUDController *result;

  result = (_TtC8Freeform32CRLPersistentFollowHUDController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPersistentFollowHUDController", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_followingParticipant));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_containerView));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_manager);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_crlaxViewControllerForLCVInteractions);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_timeStartedShowing, &qword_1013E04F0);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_heightConstraint));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_accessibilityExperienceCoordinator);
  sub_1004C1024(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler), *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_stopButtonClickedHandler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController____lazy_storage___participantColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController____lazy_storage____label));
}

- (void)updateForAppearance
{
  _TtC8Freeform32CRLPersistentFollowHUDController *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = self;
  sub_100C19A2C();
  v3 = objc_msgSend(*(id *)((char *)&v2->super.isa + OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_hudView), "layer");
  v4 = sub_1007EFD20();
  v5 = objc_msgSend(v4, "UIColor");

  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform32CRLPersistentFollowHUDController_crlaxViewControllerForLCVInteractions);
  if (!Strong)
    Strong = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
  return Strong;
}

@end
