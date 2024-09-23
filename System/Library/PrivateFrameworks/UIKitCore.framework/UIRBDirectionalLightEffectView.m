@implementation UIRBDirectionalLightEffectView

- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit30UIRBDirectionalLightEffectView *)UIRBDirectionalLightEffectView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5UIKit30UIRBDirectionalLightEffectView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1857A4A18();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for UIRBDirectionalLightEffectView();
  v2 = (char *)v4.receiver;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_drawingView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void)update:(id)a3
{
  id v4;
  _TtC5UIKit30UIRBDirectionalLightEffectView *v5;

  v4 = a3;
  v5 = self;
  sub_1857A2CA8(v4);

}

- (void)didMoveToWindow
{
  _TtC5UIKit30UIRBDirectionalLightEffectView *v2;

  v2 = self;
  sub_1857A2EAC();

}

- (void).cxx_destruct
{
  sub_18518D718(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_alongsideAnimation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_drawingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_displayLink));
  sub_18518D718(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_completionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit30UIRBDirectionalLightEffectView_alongsideAnimationCurve));
}

@end
