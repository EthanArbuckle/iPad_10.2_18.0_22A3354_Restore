@implementation RecencyIconView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label), sel_firstBaselineAnchor);
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label), sel_lastBaselineAnchor);
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label));
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI15RecencyIconView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = *(double *)((char *)&v3->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);
  v6 = v4
     + *(double *)((char *)&v3->super.super.__layeringSceneIdentity + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout)
     + *(double *)((char *)&v3->super._cachedTraitCollection + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);
  v8 = v7 + *(double *)((char *)&v3->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);

  v9 = v8 + v5;
  v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI15RecencyIconView *v2;

  v2 = self;
  sub_22B253CC4();

}

- (void)didMoveToSuperview
{
  _TtC9SeymourUI15RecencyIconView *v2;

  v2 = self;
  sub_22B253DC4();

}

- (_TtC9SeymourUI15RecencyIconView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B2547E0();
}

- (_TtC9SeymourUI15RecencyIconView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI15RecencyIconView *result;

  result = (_TtC9SeymourUI15RecencyIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
