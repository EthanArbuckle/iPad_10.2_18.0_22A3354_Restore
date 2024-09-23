@implementation NCInternalToolsOverlayView

+ (id)debugViewIfInternal
{
  if (MEMORY[0x1D17DCDFC]("UserNotificationsUIKit:InternalToolsOverlayView", a2))
    return objc_msgSend(objc_allocWithZone((Class)NCInternalToolsOverlayView), sel_init);
  else
    return 0;
}

- (NCInternalToolsOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo26NCInternalToolsOverlayViewC22UserNotificationsUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (NCInternalToolsOverlayViewDelegate)delegate
{
  return (NCInternalToolsOverlayViewDelegate *)(id)MEMORY[0x1D17DD63C]((char *)self+ OBJC_IVAR___NCInternalToolsOverlayView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NCInternalToolsOverlayView)init
{
  return (NCInternalToolsOverlayView *)sub_1CFD3EB70();
}

- (void)layoutSubviews
{
  NCInternalToolsOverlayView *v2;
  void *v3;
  id v4;
  NCInternalToolsOverlayView *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCInternalToolsOverlayView;
  v2 = self;
  -[NCInternalToolsOverlayView layoutSubviews](&v6, sel_layoutSubviews);
  sub_1CFD3E8B4();
  v3 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer);
  v4 = objc_msgSend(v3, sel_view, v6.receiver, v6.super_class);

  if (!v4)
  {
    v5 = (NCInternalToolsOverlayView *)-[NCInternalToolsOverlayView superview](v2, sel_superview);
    -[NCInternalToolsOverlayView addGestureRecognizer:](v5, sel_addGestureRecognizer_, v3);

    v2 = v5;
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  NCInternalToolsOverlayView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  NCInternalToolsOverlayView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (NCInternalToolsOverlayView)initWithFrame:(CGRect)a3
{
  NCInternalToolsOverlayView *result;

  result = (NCInternalToolsOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CFD3E3A0((uint64_t)self + OBJC_IVAR___NCInternalToolsOverlayView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCInternalToolsOverlayView_debugHUDContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___NCInternalToolsOverlayView_hostingViewController));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  NCInternalToolsOverlayView *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = NCInternalToolsOverlayView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BOOL result;

  result = 0;
  if (*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NCInternalToolsOverlayView_doubleTapLongPressRecognizer) == a3)
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      return 1;
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      return 1;
  }
  return result;
}

- (void)handleLongPress:(id)a3
{
  id v4;
  id v5;
  NCInternalToolsOverlayView *v6;

  v4 = a3;
  v6 = self;
  v5 = objc_msgSend(v4, sel_state);
  if (v5 == (id)3)
  {
    sub_1CFD3F988();
  }
  else if (v5 == (id)1)
  {
    objc_msgSend(v4, sel_locationInView_, v6);
    sub_1CFD3F778();
  }

}

@end
