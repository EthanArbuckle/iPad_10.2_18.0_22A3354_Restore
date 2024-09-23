@implementation CRLTransientRefollowHUDController

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hudView));
}

- (void)setHudView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hudView) = (Class)a3;
  v3 = a3;

}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_containerView));
}

- (void)setContainerView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_containerView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_containerView) = (Class)a3;
  v3 = a3;

}

- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager
{
  return (_TtP8Freeform23CRLStatusHUDManaging_mi_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_manager);
}

- (void)setManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_manager, a3);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_type);
}

- (NSString)message
{
  uint64_t v2;
  NSString v3;

  sub_100883FB8();
  if (v2)
  {
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_maximumShowDuration) = a3;
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
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_timeStartedShowing;
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
  _TtC8Freeform33CRLTransientRefollowHUDController *v11;
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
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_timeStartedShowing;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_timeStartedShowing, v13, 33, 0);
  v11 = self;
  sub_10056AFBC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (double)timeLeftToShow
{
  _TtC8Freeform33CRLTransientRefollowHUDController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_10088192C();
  v4 = v3;

  return v4;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideTimer) = (Class)a3;
  v3 = a3;

}

- (BOOL)showing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_showing);
}

- (void)setShowing:(BOOL)a3
{
  _TtC8Freeform33CRLTransientRefollowHUDController *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_showing) = a3;
  v3 = self;
  sub_100881B28();

}

- (BOOL)animating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_animating) = a3;
}

- (BOOL)hiding
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_accessibilityAnnouncement];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_accessibilityAnnouncement]);
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_accessibilityAnnouncement);
  v7 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_accessibilityAnnouncement];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)swipable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipeGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (void)swipedWithSender:(id)a3
{
  id v4;
  _TtC8Freeform33CRLTransientRefollowHUDController *v5;

  if (a3)
  {
    v5 = self;
    v4 = a3;
    sub_100880FF4(1, (uint64_t)&unk_101283B68, (uint64_t)sub_1008841BC, (uint64_t)&unk_101283B80);

  }
}

- (BOOL)hideOnTouch
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_heightConstraint);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_heightConstraint) = (Class)a3;
  v3 = a3;

}

- (void)resumeButtonClickedWithSender:(id)a3
{
  void (*v4)(uint64_t);
  uint64_t v5;
  _TtC8Freeform33CRLTransientRefollowHUDController *v6;
  uint64_t v7;
  _TtC8Freeform33CRLTransientRefollowHUDController *v8;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_refollowClickedHandler);
  if (v4)
  {
    v5 = *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_refollowClickedHandler];
    swift_unknownObjectRetain(a3);
    v6 = self;
    v7 = sub_1004C0F54((uint64_t)v4, v5);
    v4(v7);
    sub_1004C1024((uint64_t)v4, v5);
  }
  else
  {
    swift_unknownObjectRetain(a3);
    v8 = self;
  }
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hideOnTouch) == 1)
    sub_100880FF4(1, (uint64_t)&unk_101283B68, (uint64_t)sub_1008841BC, (uint64_t)&unk_101283B80);
  swift_unknownObjectRelease(a3);

}

- (_TtC8Freeform33CRLTransientRefollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 resumeButtonClickedHandler:(id)a7
{
  void *v12;
  uint64_t v13;
  id v14;

  v12 = _Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject(&unk_101283BD8, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_100565828;
  }
  else
  {
    v13 = 0;
  }
  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v14 = a4;
  swift_unknownObjectRetain(a5);
  return (_TtC8Freeform33CRLTransientRefollowHUDController *)sub_100883D64((uint64_t)a3, v14, (uint64_t)a5, (uint64_t)v12, v13, self, a6);
}

- (_TtC8Freeform33CRLTransientRefollowHUDController)init
{
  _TtC8Freeform33CRLTransientRefollowHUDController *result;

  result = (_TtC8Freeform33CRLTransientRefollowHUDController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTransientRefollowHUDController", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_followingParticipant));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_containerView));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_manager);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_crlaxViewControllerForLCVInteractions);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_timeStartedShowing, &qword_1013E04F0);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_heightConstraint));
  swift_bridgeObjectRelease();
  sub_1004C1024(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_refollowClickedHandler), *(_QWORD *)&self->followingParticipant[OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_refollowClickedHandler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController____lazy_storage___participantColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController____lazy_storage____label));
}

- (void)updateForAppearance
{
  _TtC8Freeform33CRLTransientRefollowHUDController *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = self;
  sub_100C19A2C();
  v3 = objc_msgSend(*(id *)((char *)&v2->super.isa + OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_hudView), "layer");
  v4 = sub_100882074();
  v5 = objc_msgSend(v4, "UIColor");

  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform33CRLTransientRefollowHUDController_crlaxViewControllerForLCVInteractions);
  if (!Strong)
    Strong = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
  return Strong;
}

@end
