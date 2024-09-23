@implementation SiriSharedUIDropletContainerView

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView);
  if (v2)
  {
    objc_msgSend(v2, sel_intrinsicContentSize);
  }
  else
  {
    v4 = *MEMORY[0x1E0DC55F0];
    v3 = *MEMORY[0x1E0DC55F0];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s12SiriSharedUI0aB22UIDropletContainerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView));
}

- (void)setContentView:(id)a3
{
  void *v4;
  _TtC12SiriSharedUI32SiriSharedUIDropletContainerView *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_1DE12C5F8(v4);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1DE12D318(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_1DE12D368(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_setFrame_, (SEL *)&selRef_frame);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1DE12D318(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_1DE12D368(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_setBounds_, (SEL *)&selRef_bounds);
}

- (CGPoint)center
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  -[SiriSharedUIDropletContainerView center](&v4, sel_center);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  v5 = v6.receiver;
  -[SiriSharedUIDropletContainerView setCenter:](&v6, sel_setCenter_, x, y);
  sub_1DE12D608();

}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  result = (CGAffineTransform *)-[CGAffineTransform transform](&v10, sel_transform);
  v5 = v8;
  v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  CGFloat tx;
  CGFloat ty;
  id v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
  CGFloat v9;
  CGFloat v10;
  objc_super v11;

  v6 = *(_OWORD *)&a3->c;
  v7 = *(_OWORD *)&a3->a;
  tx = a3->tx;
  ty = a3->ty;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  v5 = v11.receiver;
  v8[0] = v7;
  v8[1] = v6;
  v9 = tx;
  v10 = ty;
  -[SiriSharedUIDropletContainerView setTransform:](&v11, sel_setTransform_, v8);
  sub_1DE12D7D0();

}

- (void)removeFromSuperview
{
  _TtC12SiriSharedUI32SiriSharedUIDropletContainerView *v2;

  v2 = self;
  sub_1DE12D924();

}

- (void)layoutSubviews
{
  _TtC12SiriSharedUI32SiriSharedUIDropletContainerView *v2;

  v2 = self;
  sub_1DE12DA14();

}

- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithFrame:(CGRect)a3
{
  _TtC12SiriSharedUI32SiriSharedUIDropletContainerView *result;

  result = (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_shimmerEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_hostingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentLightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_edgeLightInsideEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_edgeLightOutsideEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_rimHighlightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_latencyEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentLightEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_snippetBackgroundView));
}

@end
