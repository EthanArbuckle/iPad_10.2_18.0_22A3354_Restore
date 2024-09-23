@implementation StrokeView

- (_TtC15StrokeAnimation10StrokeView)initWith:(id)a3 frame:(CGRect)a4
{
  id v4;
  _TtC15StrokeAnimation10StrokeView *result;

  v4 = a3;
  StrokeView.init(with:frame:)();
  return result;
}

- (_TtC15StrokeAnimation10StrokeView)initWithFrame:(CGRect)a3
{
  _TtC15StrokeAnimation10StrokeView *result;

  StrokeView.init(frame:)();
  return result;
}

- (_TtC15StrokeAnimation10StrokeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  StrokeView.init(coder:)();
}

- (void)_didTapView:(id)a3
{
  id v4;
  _TtC15StrokeAnimation10StrokeView *v5;

  v4 = a3;
  v5 = self;
  sub_2295DDEA4(v4);

}

- (void)layoutSubviews
{
  _TtC15StrokeAnimation10StrokeView *v2;

  v2 = self;
  StrokeView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC15StrokeAnimation10StrokeView *v4;
  unint64_t v5;
  CGSize v6;
  double v7;
  double height;
  CGSize result;

  width = a3.width;
  v4 = self;
  v6 = StrokeView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, *(unint64_t *)&width));

  v7 = v6.width;
  height = v6.height;
  result.height = height;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15StrokeAnimation10StrokeView *v6;
  _TtC15StrokeAnimation10StrokeView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  StrokeView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  sub_2295DFE14((uint64_t)self + OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationDelegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_animationView);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundView);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundImageView);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeData);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_pronunciationLabel);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_strokeContourLayer);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_backgroundLayer);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_colorForbackgroundView);
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_contourColor);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_3(OBJC_IVAR____TtC15StrokeAnimation10StrokeView_queue);
  swift_bridgeObjectRelease();
}

- (void)updateWithData:(id)a3
{
  objc_class *v4;
  SAStrokeData v5;
  SAStrokeDataInternal *underlyingObject;

  v4 = (objc_class *)a3;
  v5._underlyingObject = (SAStrokeDataInternal *)self;
  underlyingObject = v5._underlyingObject;
  v5.super.isa = v4;
  StrokeView.update(with:)(v5);

}

- (SAStrokeAnimatingDelegate)interactionDelegate
{
  StrokeView.interactionDelegate.getter();
}

- (void)setInteractionDelegate:(id)a3
{
  _TtC15StrokeAnimation10StrokeView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  StrokeView.interactionDelegate.setter();

}

- (void)startAnimationRepeating:(BOOL)a3
{
  _TtC15StrokeAnimation10StrokeView *v3;

  v3 = self;
  StrokeView.startAnimationRepeating(_:)(0);

}

- (void)endAnimation
{
  _TtC15StrokeAnimation10StrokeView *v2;

  v2 = self;
  StrokeView.endAnimation()();

}

@end
