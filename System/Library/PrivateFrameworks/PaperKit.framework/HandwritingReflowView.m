@implementation HandwritingReflowView

- (_TtC8PaperKit21HandwritingReflowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized HandwritingReflowView.init(coder:)();
}

- (void)didMoveToWindow
{
  _TtC8PaperKit21HandwritingReflowView *v2;

  v2 = self;
  HandwritingReflowView.didMoveToWindow()();

}

- (void)tap
{
  void *v2;
  _TtC8PaperKit21HandwritingReflowView *v3;

  v2 = (void *)*((unsigned __int8 *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_isInReflowMode);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_isInReflowMode) = v2 ^ 1;
  v3 = self;
  HandwritingReflowView.isInReflowMode.didset(v2);

}

- (void)drawingContinuation:(id)a3
{
  UILongPressGestureRecognizer *v4;
  _TtC8PaperKit21HandwritingReflowView *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  HandwritingReflowView.drawingContinuation(_:)(v4);

}

- (void)longPress:(id)a3
{
  UILongPressGestureRecognizer *v4;
  _TtC8PaperKit21HandwritingReflowView *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  HandwritingReflowView.longPress(_:)(v4);

}

- (void)layoutSubviews
{
  _TtC8PaperKit21HandwritingReflowView *v2;

  v2 = self;
  HandwritingReflowView.layoutSubviews()();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit21HandwritingReflowView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  HandwritingReflowView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC8PaperKit21HandwritingReflowView *v9;
  Class isa;

  v7 = a3;
  v8 = a4;
  v9 = self;
  isa = specialized HandwritingReflowView.editMenuInteraction(_:menuFor:suggestedActions:)().super.super.isa;

  return isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_reflowTextbox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_caret));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit21HandwritingReflowView_editMenuInteraction));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
