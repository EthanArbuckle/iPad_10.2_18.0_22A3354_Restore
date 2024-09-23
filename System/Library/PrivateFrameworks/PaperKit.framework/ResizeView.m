@implementation ResizeView

- (_TtC8PaperKit10ResizeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ResizeView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC8PaperKit10ResizeView *v2;

  v2 = self;
  ResizeView.layoutSubviews()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit10ResizeView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  ResizeView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void)resizeHandleMoved:(id)a3
{
  id v4;
  _TtC8PaperKit10ResizeView *v5;

  v4 = a3;
  v5 = self;
  ResizeView.resizeHandleMoved(_:)(v4);

}

- (void)dragMoved:(id)a3
{
  UIPanGestureRecognizer *v4;
  _TtC8PaperKit10ResizeView *v5;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = self;
  ResizeView.dragMoved(_:)(v4);

}

- (void)rotate:(id)a3
{
  UIRotationGestureRecognizer *v4;
  _TtC8PaperKit10ResizeView *v5;

  v4 = (UIRotationGestureRecognizer *)a3;
  v5 = self;
  ResizeView.rotate(_:)(v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC8PaperKit10ResizeView *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = ResizeView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  _TtC8PaperKit10ResizeView *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  v9 = ResizeView.gestureRecognizer(_:shouldBeRequiredToFailBy:)(v6, v7);

  return v9;
}

- (_TtC8PaperKit10ResizeView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit10ResizeView *result;

  result = (_TtC8PaperKit10ResizeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of ResizeView.ActiveHandle(*(id *)((char *)&self->super.super.super.isa
                                                    + OBJC_IVAR____TtC8PaperKit10ResizeView_currentActiveHandle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit10ResizeView_rotationGestureRecognizer));

}

@end
