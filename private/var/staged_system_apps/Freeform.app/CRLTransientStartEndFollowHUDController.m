@implementation CRLTransientStartEndFollowHUDController

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView));
}

- (void)setHudView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView) = (Class)a3;
  v3 = a3;

}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView));
}

- (void)setContainerView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView) = (Class)a3;
  v3 = a3;

}

- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager
{
  return (_TtP8Freeform23CRLStatusHUDManaging_mi_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_manager);
}

- (void)setManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_manager, a3);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_type);
}

- (NSString)message
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100666C98();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_maximumShowDuration) = a3;
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
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1004E1F60((uint64_t)v6, (uint64_t)v5);
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
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v11;
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
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing, v13, 33, 0);
  v11 = self;
  sub_10056AFBC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (double)timeLeftToShow
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_100666598();
  v4 = v3;

  return v4;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer) = (Class)a3;
  v3 = a3;

}

- (BOOL)showing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_showing);
}

- (void)setShowing:(BOOL)a3
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_showing) = a3;
  v3 = self;
  sub_100666784();

}

- (BOOL)animating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_animating) = a3;
}

- (BOOL)hiding
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement]);
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
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement);
  v7 = *(_QWORD *)&self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)swipable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (void)swipedWithSender:(id)a3
{
  id v4;
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v5;

  if (a3)
  {
    v5 = self;
    v4 = a3;
    sub_100880FD8(1);

  }
}

- (BOOL)hideOnTouch
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 followingParticipant:(id)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7
{
  id v13;

  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v13 = a4;
  swift_unknownObjectRetain(a5);
  return (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)sub_1006686D0((uint64_t)a3, v13, (uint64_t)a5, a7, self, a6);
}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)initWithManager:(id)a3 numberOfParticipants:(int64_t)a4 delegate:(id)a5 canvasWidth:(double)a6 isStartFollow:(BOOL)a7
{
  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a5);
  return (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)sub_1006688D0((uint64_t)a3, (void *)a4, (uint64_t)a5, a7, self, a6);
}

- (_TtC8Freeform39CRLTransientStartEndFollowHUDController)init
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *result;

  result = (_TtC8Freeform39CRLTransientStartEndFollowHUDController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTransientStartEndFollowHUDController", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100668588(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_followingParticipantInfo), self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_followingParticipantInfo]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hudView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_containerView));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_manager);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_delegate);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_timeStartedShowing, &qword_1013E04F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideTimer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->followingParticipantInfo[OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_accessibilityAnnouncement]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_heightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_constraints));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController____lazy_storage____label));
}

- (void)touchedHUDWithSender:(id)a3
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v5;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform39CRLTransientStartEndFollowHUDController_hideOnTouch) == 1)
  {
    swift_unknownObjectRetain(a3);
    v5 = self;
    sub_100880FD8(1);
    swift_unknownObjectRelease(a3);

  }
}

- (void)updateForAppearance
{
  _TtC8Freeform39CRLTransientStartEndFollowHUDController *v2;

  v2 = self;
  sub_100C19A2C();

}

@end
