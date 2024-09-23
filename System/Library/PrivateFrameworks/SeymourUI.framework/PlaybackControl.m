@implementation PlaybackControl

- (BOOL)isEnabled
{
  return sub_22B335184(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlaybackControl();
  v4 = v7.receiver;
  -[PlaybackControl setEnabled:](&v7, sel_setEnabled_, v3);
  v5 = objc_msgSend(v4, sel_isEnabled, v7.receiver, v7.super_class);
  v6 = 0.5;
  if (v5)
    v6 = 1.0;
  objc_msgSend(v4, sel_setAlpha_, v6);

}

- (BOOL)isHighlighted
{
  return sub_22B335184(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC9SeymourUI15PlaybackControl *v4;

  v4 = self;
  sub_22B335200(a3);

}

- (_TtC9SeymourUI15PlaybackControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B336120();
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_width);
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI15PlaybackControl_transitionView)+ OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_widthConstraint), sel_constant);
  if (v2 > v3)
    v3 = v2;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI15PlaybackControl)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI15PlaybackControl *result;

  result = (_TtC9SeymourUI15PlaybackControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_transitionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_widthConstraint));
}

@end
