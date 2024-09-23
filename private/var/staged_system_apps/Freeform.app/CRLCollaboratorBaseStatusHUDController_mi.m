@implementation CRLCollaboratorBaseStatusHUDController_mi

- (UIView)hudView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView));
}

- (void)setHudView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView) = (Class)a3;
  v3 = a3;

}

- (UIView)containerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView));
}

- (void)setContainerView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView) = (Class)a3;
  v3 = a3;

}

- (_TtP8Freeform23CRLStatusHUDManaging_mi_)manager
{
  return (_TtP8Freeform23CRLStatusHUDManaging_mi_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_manager);
}

- (void)setManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_manager, a3);
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_type);
}

- (NSString)message
{
  void (*v2)(void);
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x2B8);
  v3 = self;
  v2();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (double)minimumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_minimumShowDuration);
}

- (void)setMinimumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_minimumShowDuration) = a3;
}

- (double)maximumShowDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_maximumShowDuration);
}

- (void)setMaximumShowDuration:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_maximumShowDuration) = a3;
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
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing;
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
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v11;
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
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing, v13, 33, 0);
  v11 = self;
  sub_10056AFBC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (double)timeLeftToShow
{
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v2;
  double v3;
  double v4;

  v2 = self;
  sub_100665440();
  v4 = v3;

  return v4;
}

- (NSTimer)hideTimer
{
  return (NSTimer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer));
}

- (void)setHideTimer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer) = (Class)a3;
  v3 = a3;

}

- (BOOL)showing
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_showing);
}

- (void)setShowing:(BOOL)a3
{
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_showing) = a3;
  v3 = self;
  sub_100665624();

}

- (BOOL)animating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_animating);
}

- (void)setAnimating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_animating) = a3;
}

- (BOOL)hiding
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hiding);
}

- (void)setHiding:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hiding) = a3;
}

- (NSString)accessibilityAnnouncement
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->hudView[OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->hudView[OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement]);
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
                 + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement);
  v7 = *(_QWORD *)&self->hudView[OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)swipable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipable);
}

- (void)setSwipable:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipable) = a3;
}

- (UIGestureRecognizer)swipeGestureRecognizer
{
  return (UIGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer));
}

- (void)setSwipeGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (void)swipedWithSender:(id)a3
{
  id v4;
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v5;

  if (a3)
  {
    v5 = self;
    v4 = a3;
    sub_100880FBC(1);

  }
}

- (BOOL)hideOnTouch
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch);
}

- (void)setHideOnTouch:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch) = a3;
}

- (double)height
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_height);
}

- (void)setHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_height) = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint));
}

- (void)setHeightConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint) = (Class)a3;
  v3 = a3;

}

- (void)touchedHUDWithSender:(id)a3
{
  int v5;
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v6;
  void *Strong;
  void *v8;
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v9;

  v5 = *((unsigned __int8 *)&self->super.isa
       + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideOnTouch);
  swift_unknownObjectRetain(a3);
  v6 = self;
  v9 = v6;
  if (v5 == 1)
  {
    sub_100880FBC(1);
    v6 = v9;
  }
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)v6 + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_delegate);
  if (Strong)
  {
    v8 = Strong;
    objc_msgSend(Strong, "collabHUDActivated");
    swift_unknownObjectRelease(a3);

    swift_unknownObjectRelease(v8);
  }
  else
  {
    swift_unknownObjectRelease(a3);

  }
}

- (void)updateForAppearance
{
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v2;

  v2 = self;
  sub_100C19A2C();

}

- (void)action
{
  uint64_t Strong;
  void *v4;
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "collabHUDActivated");

    swift_unknownObjectRelease(v4);
  }
}

- (_TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi)init
{
  _TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *result;

  result = (_TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollaboratorBaseStatusHUDController_mi", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hudView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_containerView));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_manager);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_delegate);
  sub_1004C113C((uint64_t)self + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_timeStartedShowing);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_hideTimer));
  swift_bridgeObjectRelease(*(_QWORD *)&self->hudView[OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_accessibilityAnnouncement]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_swipeGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_heightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi_constraints));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform41CRLCollaboratorBaseStatusHUDController_mi____lazy_storage____label));
}

@end
