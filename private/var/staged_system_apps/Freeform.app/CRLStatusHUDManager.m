@implementation CRLStatusHUDManager

- (BOOL)ready
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready, v4, 0, 0);
  return *v2;
}

- (void)setReady:(BOOL)a3
{
  _BOOL4 v3;
  _BYTE *v5;
  _TtC8Freeform19CRLStatusHUDManager *v6;
  _BYTE v7[24];

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready, v7, 1, 0);
  *v5 = v3;
  if (v3)
  {
    v6 = self;
    sub_100C5F4C4();

  }
}

- (id)delayedControllers
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers, v4, 0, 0);
  return *v2;
}

- (void)setDelayedControllers:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_delayedControllers, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (UIView)containerView
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView, v4, 0, 0);
  return (UIView *)*v2;
}

- (void)setContainerView:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC8Freeform19CRLStatusHUDManager *v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE v11[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView, v11, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = (char *)v8 + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready;
  swift_beginAccess((char *)v8 + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_ready, &v10, 0, 0);
  if (*v9 == 1)
    sub_100C5F4C4();

}

- (BOOL)alwaysUseDarkAppearance
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance, v4, 0, 0);
  return *v2;
}

- (void)setAlwaysUseDarkAppearance:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_alwaysUseDarkAppearance, v5, 1, 0);
  *v4 = a3;
}

- (double)maxTextWidth
{
  _TtC8Freeform19CRLStatusHUDManager *v2;
  double v3;
  double v4;

  v2 = self;
  CRLStatusHUDManager.maxTextWidth.getter();
  v4 = v3;

  return v4;
}

- (double)maxHUDWidth
{
  void **v3;
  void *v4;
  _TtC8Freeform19CRLStatusHUDManager *v5;
  id v6;
  void *v7;
  double Width;
  _BYTE v10[24];
  CGRect v11;

  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerView, v10, 0, 0);
  v4 = *v3;
  if (v4)
  {
    v5 = self;
    v6 = objc_msgSend(v4, "window");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "bounds");
      Width = CGRectGetWidth(v11);

      return fmin(Width, 375.0);
    }

  }
  return 375.0;
}

- (void)showWithHudController:(id)a3
{
  _TtC8Freeform19CRLStatusHUDManager *v5;

  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100C61A10(a3, (uint64_t)v5);
  swift_unknownObjectRelease(a3);

}

- (void)showWithHudController:(id)a3 withDelay:(double)a4
{
  _TtC8Freeform19CRLStatusHUDManager *v7;

  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v7 = self;
  sub_100C61A18(a3, (uint64_t)v7, a4);
  swift_unknownObjectRelease(a3);

}

- (void)replaceHudController:(id)a3 withHudController:(id)a4
{
  _TtC8Freeform19CRLStatusHUDManager *v7;

  swift_getObjectType(a4);
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100C6171C(a3, a4, (uint64_t)v7);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)hideWithHudController:(id)a3
{
  _TtC8Freeform19CRLStatusHUDManager *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  CRLStatusHUDManager.hide(hudController:)(a3);
  swift_unknownObjectRelease(a3);

}

- (void)hideAllControllers
{
  _TtC8Freeform19CRLStatusHUDManager *v2;

  v2 = self;
  CRLStatusHUDManager.hideAllControllers()();

}

- (void)updateForAppearance
{
  _TtC8Freeform19CRLStatusHUDManager *v2;

  v2 = self;
  CRLStatusHUDManager.updateForAppearance()();

}

- (int64_t)containerViewVerticalLayoutGravity
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity, v4, 0, 0);
  return *v2;
}

- (void)setContainerViewVerticalLayoutGravity:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_containerViewVerticalLayoutGravity, v5, 1, 0);
  *v4 = a3;
}

- (_TtC8Freeform19CRLStatusHUDManager)init
{
  return (_TtC8Freeform19CRLStatusHUDManager *)CRLStatusHUDManager.init()();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_errorController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_showingInfoControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_waitingInfoControllers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_waitingToHideControllers));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_hidingController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLStatusHUDManager_constraints));
}

@end
